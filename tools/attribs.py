#!python3
import sys

def update(line):
    return line.replace('}', 'noredzone noimplicitfloat "null-pointer-is-valid" }')

with open(sys.argv[1], 'r', encoding = 'utf-8') as fp:
    lines = fp.readlines()

for idx, line in enumerate(lines):
    if not line.startswith('attributes'):
        continue

    lines[idx] = update(line)

with open(sys.argv[2], 'w', encoding = 'utf-8') as fp:
    for line in lines:
        fp.write(line)
