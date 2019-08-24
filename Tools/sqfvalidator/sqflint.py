import argparse
import os
import re
import sys

from sqf.parser import parse
import sqf.analyzer
from sqf.exceptions import SQFParserError, SQFWarning


class Writer:
    def __init__(self):
        self.strings = []

    def write(self, message):
        self.strings.append(message)


def analyze(code, writer, exceptions_list, errorsonly):
    try:
        result = parse(code)
    except SQFParserError as e:
        writer.write('[%d,%d]:%s\n' % (e.position[0], e.position[1] - 1, e.message))
        exceptions_list += [e]
        return

    exceptions = sqf.analyzer.analyze(result).exceptions
    for e in exceptions:
        if errorsonly and isinstance(e, SQFWarning):
          continue
        writer.write('[%d,%d]:%s\n' % (e.position[0], e.position[1] - 1, e.message))
    exceptions_list += exceptions

def analyze_dir(directory, writer, exceptions_list, exclude, errorsonly):
    """
    Analyzes a directory recursively
    """
    for root, dirs, files in os.walk(directory):
        if any([re.match(s, root) for s in exclude.copy()]):
            writer.write(root + ' EXCLUDED\n')
            continue
        files.sort()
        for file in files:
            if file.endswith(".sqf"):
                file_path = os.path.join(root, file)
                if any([re.match(s, file_path) for s in exclude.copy()]):
                    writer.write(file_path + ' EXCLUDED\n')
                    continue

                writer_helper = Writer()

                with open(file_path) as f:
                    analyze(f.read(), writer_helper, exceptions_list, errorsonly)

                if writer_helper.strings:
                    writer.write(os.path.relpath(file_path, directory) + '\n')
                    for string in writer_helper.strings:
                        writer.write('\t%s' % string)
    return writer


def readable_dir(prospective_dir):
    if not os.path.isdir(prospective_dir):
        raise Exception("readable_dir:{0} is not a valid path".format(prospective_dir))
    if os.access(prospective_dir, os.R_OK):
        return prospective_dir
    else:
        raise Exception("readable_dir:{0} is not a readable dir".format(prospective_dir))

def parse_args(args):
    parser = argparse.ArgumentParser(description="Static Analyzer of SQF code")
    parser.add_argument('file', nargs='?', type=argparse.FileType('r'), default=None,
                        help='The full path of the file to be analyzed')
    parser.add_argument('-d', '--directory', nargs='?', type=readable_dir, default=None,
                        help='The full path of the directory to recursively analyse sqf files on')
    parser.add_argument('-o', '--output', nargs='?', type=argparse.FileType('w'), default=None,
                        help='File path to redirect the output to (default to stdout)')
    parser.add_argument('-x', '--exclude', action='append', nargs='?', help='Path that should be ignored (regex)', default=[])
    parser.add_argument('-l', '--errorsonly', nargs='?', const=True, default=False,
                        help='Limited mode, show only errors, omit warnings')
    parser.add_argument('-e', '--exit', type=str, default='',
                        help='How the parser should exit. \'\': exit code 0;\n'
                             '\'e\': exit with code 1 when any error is found;\n'
                             '\'w\': exit with code 1 when any error or warning is found.')

    return parser.parse_args(args)


def entry_point(args):
    args = parse_args(args)

    if args.output is None:
        writer = sys.stdout
    else:
        writer = args.output

    exceptions_list = []
    errorsonly = args.errorsonly

    if args.file is None and args.directory is None:
        code = sys.stdin.read()
        analyze(code, writer, exceptions_list)
    elif args.file is not None:
        code = args.file.read()
        args.file.close()
        analyze(code, writer, exceptions_list, errorsonly)
    else:
        directory = args.directory.rstrip('/')
        exclude = list(map(lambda x: x if x.startswith('/') else os.path.join(directory, x), args.exclude))
        analyze_dir(directory, writer, exceptions_list, exclude, errorsonly)

    if args.output is not None:
        writer.close()

    exit_code = 0
    if args.exit == 'e':
        errors = [e for e in exceptions_list if isinstance(e, SQFParserError)]
        exit_code = int(len(errors) != 0)
    elif args.exit == 'w':
        errors_and_warnings = [e for e in exceptions_list if isinstance(e, (SQFWarning, SQFParserError))]
        exit_code = int(len(errors_and_warnings) != 0)
    return int(exit_code)


def main():
    sys.exit(entry_point(sys.argv[1:]))


if __name__ == "__main__":
    main()
