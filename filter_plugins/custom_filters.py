import re

class FilterModule(object):
    def filters(self):
        return {
            'regexp_replace': self.regexp_replace,
        }

    def regexp_replace(self, value, find, replace):
        return re.sub(find, replace, value)

