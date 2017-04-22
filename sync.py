#!/usr/bin/env python
"""
Syncronize dot file links to repo.
Based on https://gist.github.com/490016
"""

import os
import glob
import shutil

SOURCE_DIR = '~/projects/dotfiles/tilde'
EXCLUDE = []
NO_DOT_PREFIX = []
PRESERVE_EXTENSION = []

def force_remove(path):
    if os.path.isdir(path) and not os.path.islink(path):
        shutil.rmtree(path, False)
    else:
        os.unlink(path)

def is_link_to(link, dest):
    is_link = os.path.islink(link)
    is_link = is_link and os.readlink(link).rstrip('/') == dest.rstrip('/')
    return is_link

def link(src, dst):
    # Check that we aren't overwriting anything
    if os.path.lexists(dst):
        if is_link_to(dst, src):
            return

        response = raw_input("Overwrite file `%s'? [y/N] " % dst)
        if not response.lower().startswith('y'):
            print "Skipping `%s'..." % dst
            return

        force_remove(dst)

    os.symlink(src, dst)
    print "%s => %s" % (dst, src)

def main():
    os.chdir(os.path.expanduser(SOURCE_DIR))
    for filename in [file for file in glob.glob('*') if file not in EXCLUDE]:
        dotfile = filename
        if filename not in NO_DOT_PREFIX:
            dotfile = '.' + dotfile
        if filename not in PRESERVE_EXTENSION:
            dotfile = os.path.splitext(dotfile)[0]
        dotfile = os.path.join(os.path.expanduser('~'), dotfile)
        source = os.path.join(SOURCE_DIR, filename).replace('~', '.')

        link(source, dotfile)

if __name__ == '__main__':
    main()
