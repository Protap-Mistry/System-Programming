import re
import sys
import time

def word_count(string):
    counts = dict()

    # The dict() function creates a dictionary. A dictionary is a collection which is unordered, changeable and indexed.
    # dict(keyword arguments) As many keyword arguments you like, separated by comma: key = value, key = value ...

    words = re.split(r'[^\w]', string)

    # re.split(pattern, str) Split the string by each occurrence of the pattern.
    # [] Square brackets specifies a set of characters you wish to match.
    # The caret symbol ^ is used to check if a string starts with a certain character.
    # \w - Matches any alphanumeric character (digits and alphabets). Equivalent to [a-zA-Z0-9_].

    for word in words:
        if word in counts:
            counts[word] += 1
        else:
            counts[word] = 1

    return counts

start_time = time.time() # The time() function returns the number of seconds passed since epoch and taking current time as starting time

result = dict()

for file_name in sys.argv[1:]:
    # sys.argv() is a list of all the command line inputs. [1:] get everything after the script name
    # sys.argv[0] is the first argument in the list. In all cases, the first argument is always the name of the script.

    file = open(file_name, "rt") # 'r' open for reading (default), 't' text mode (default)

    data = file.read()
    result.update(word_count(data))


print('Number of each word in the given text file(s) are shown below:')
print(result)

print("\nExecution time: '%.2f' seconds." % (time.time() - start_time)) # again taking current time - starting time



