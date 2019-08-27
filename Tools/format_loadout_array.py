"""
This is a hacky script for formatting files containing loadout arrays exported from the Arsenal.
It's hacky. It has bugs. But most of the time, it seems to work.

If it ends up being used frequently, it should be re-worked and improved.

Run with "python format_loadout_array.py <name of .sqf with array in>"
"""

import sys

def newlineSeperator(indent):
	return "\n" + "\t" * indent

with open(sys.argv[1], "r") as templateFile:
	contents = templateFile.read()
	
	result = []
	openBracketCount = 0
	clearNewlines = False
	baseCharacterHit = False
	
	inString = False;
	
	def clearNewlinesAfterLastBracket(textList):
		locOfBracket = list(reversed(textList)).index("[") + 1
		wipedChunk = filter(lambda x: not "\n" in x, result[-locOfBracket:])
		return textList[0:-locOfBracket] + list(wipedChunk)
	
	for character in contents:			
		if character == "[":
			result.append(character)
			openBracketCount += 1
			result.append(newlineSeperator(openBracketCount))
		elif character == "]":
			openBracketCount -= 1
			if not baseCharacterHit:
				result = clearNewlinesAfterLastBracket(result)
			else:
				result.append(newlineSeperator(openBracketCount))
			result.append(character)
		elif character == ",":
			if clearNewlines:
				clearNewlines = False
				result = clearNewlinesAfterLastBracket(result)
			result.append(character)
			result.append(newlineSeperator(openBracketCount))
		elif character == "" or character == "\t" or character == "\n":
			pass
		elif not inString and character in ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]:
			clearNewlines = True
			result.append(character)
		elif character == "\"":
			inString = not inString
			result.append('"')
		else:
			result.append(character)
			
		if character == "[":
			baseCharacterHit = False
		else:
			baseCharacterHit = True

print("".join(result))