# region[Imports]
from enum import Enum, auto, unique
import os
import sys
from inspect import getmembers, isclass, isfunction
from typing import Union, Dict, Set, List, Tuple
from os import PathLike
import json
from marshmallow import fields, Schema
# endregion [Imports]


def writejson(in_object, in_file, sort_keys=True, indent=4, **kwargs):
    with open(in_file, 'w') as jsonoutfile:
        json.dump(in_object, jsonoutfile, sort_keys=sort_keys, indent=indent, **kwargs)


def pathmaker(first_segment, *in_path_segments, rev=False):
    """
    Normalizes input path or path fragments, replaces '\\\\' with '/' and combines fragments.

    Parameters
    ----------
    first_segment : str
        first path segment, if it is 'cwd' gets replaced by 'os.getcwd()'
    rev : bool, optional
        If 'True' reverts path back to Windows default, by default None

    Returns
    -------
    str
        New path from segments and normalized.
    """

    _path = first_segment

    _path = os.path.join(_path, *in_path_segments)
    if rev is True or sys.platform not in ['win32', 'linux']:
        return os.path.normpath(_path)
    return os.path.normpath(_path).replace(os.path.sep, '/')


THIS_FILE_DIR = os.path.abspath(os.path.dirname(__file__))

ANTISTASI_FOLDER_PATH = os.path.join(THIS_FILE_DIR, '..')
OUTPUT_NAME = 'repo_file_index.json'
OUTPUT_FILE = os.path.join("tools", OUTPUT_NAME)


class AntistasiFileSchema(Schema):

    class Meta:
        additional = ('full_name', 'name', 'extension', 'path', 'size')
        ordered = True


class AntistasiFile:
    schema = AntistasiFileSchema()

    def __init__(self, file_path: Union[str, PathLike]) -> None:
        self.full_path = file_path
        self.path = pathmaker(os.path.relpath(self.full_path, ANTISTASI_FOLDER_PATH))
        self.full_name = os.path.basename(self.full_path)
        self.name, self.extension = os.path.splitext(self.full_name)
        self.extension = self.extension.strip('.')
        if not self.extension:
            self.extension = None

    @property
    def stat_object(self) -> os.stat_result:
        return os.stat(self.full_path)

    @property
    def size(self):
        return self.stat_object.st_size


def walk_files():
    for dirname, folderlist, filelist in os.walk(ANTISTASI_FOLDER_PATH, topdown=True):

        if '.git' in folderlist:
            folderlist.remove('.git')
        for file in filelist:
            path = os.path.join(dirname, file)
            yield AntistasiFile(path)


def main():
    with open(OUTPUT_FILE, 'w') as f:
        f.write(AntistasiFile.schema.dumps(walk_files(), many=True, indent=4))


if __name__ == '__main__':
    main()
