import re

def regexp_replace(s, f, r):
    ''' filter for string substitution by regular expression '''
    return re.sub(f, r, s)

class FilterModule(object):

    def filters(self):
        return {
            'regexp_replace' : regexp_replace
        }
