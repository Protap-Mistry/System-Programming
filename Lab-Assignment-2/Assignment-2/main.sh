#!/usr/bin/python3

import re
import sys

def word_count(string):
    counts = dict()
    words = re.split(r'[^\w]', string)

    for word in words:
        if word in counts:
            counts[word] += 1
        else:
            counts[word] = 1

    return counts

result = dict()

if len( sys.argv ) <= 1:
    print("Wrong Argument! Please put one more argument (text files name with extension).")
    exit()

for file_name in sys.argv[1:]:
    if '.txt' not in file_name:
        print("Wrong Argument! Please enter text file(s) with .txt extension.")
        exit()

    try:
        with open(file_name, "r", encoding='utf-8') as fn: # Then after calling read() function, an encoded Unicode object is returned.
            for f in fn:
                pass
    except UnicodeDecodeError:
        print("Wrong Argument!")
        exit()

    file = open(file_name, "rt")
    data = file.read()
    result.update(word_count(data))

print('\n'.join("{} {}".format(k, v) for k, v in result.items())) #k= key, v=value; Printing all dictionary results from For Loop