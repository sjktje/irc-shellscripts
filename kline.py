#!/usr/bin/env python

import argparse
import re

class IrcTextParser:
    def __init__(self, file):
        self.file = file
        self.open_stream()

    def open_stream(self):
        try:
            self.f = open(self.file)
        except IOError:
            print 'Could not open ', self.file

    def compile_regexp(self):
        self.reg = re.compile(r'\b~?[a-zA-z0-9._-]{1,10}@([a-zA-Z0-9_.-]+)\b')

    def generate(self):
        self.compile_regexp()
        for line in self.f:
            for match in self.reg.findall(line):
                print "/KLINE 1440 *@{} ON * :drones/flooding".format(match)

def parse_cmd():
    """ Parse command line """
    parser = argparse.ArgumentParser(
        description="Create ready-to-paste /KLINEs from IRC logs."
    )
    parser.add_argument('-g, --gline', action='store_true', default=False,
            dest='gline', help='Set G-lines instead of K-lines')
    parser.add_argument('-r, --reason', action='store', dest='reason',
            help='Reason')
    parser.add_argument('-t, --time', action='store', dest='time', help='Duration of kline')
    parser.add_argument('-f', action='store', dest='file', help='file')
    return parser.parse_args()

def main():
    cmd = parse_cmd()

    parser = IrcTextParser(cmd.file)
    parser.generate()



if __name__ == "__main__":
    main()
