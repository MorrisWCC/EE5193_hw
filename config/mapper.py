#!/usr/bin/python3
"""mapper.py"""
import re
import sys
import datetime as dt

# input comes from STDIN (standard input)
for line in sys.stdin:
    # remove leading and trailing whitespace
    line = line.strip()
    # split the line into words
    access_time = re.match(r"[^[]*\[([^]]*)\]", line).groups()[0]
    access_time = access_time.split()[0]
    access_time_object = dt.datetime.strptime(access_time, '%d/%b/%Y:%H:%M:%S')
    access_time_cnt = str(access_time_object)[:13] + ":00:00"
    print('%s\t%s' % (access_time_cnt, 1))

