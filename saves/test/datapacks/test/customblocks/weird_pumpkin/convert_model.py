import json
from os import listdir
from os.path import isfile, join, dirname, realpath
mypath = dirname(realpath(__file__))
for f in listdir(mypath):
    f = join(mypath, f)
    if isfile(f) and f.endswith('.json'):
        data = json.loads(open(f).read())
        print(f"type: {data['type']}")
        if 'lightlevel' in data:
            llvl = int(data['lightlevel'])
            if llvl > 0:
                print(f'emit lightlevel of {llvl}')
        if 'display' not in data:
            data['display'] = {}
        if 'head' not in data['display']:
            data['display']['head'] = {"rotation":[0,0,0],"translation":[0,0,0],"scale":[1.002,1.002,1.002]}
        for k in data['display']['head'].copy():
            data['display']['head'][k] = [x*2.2857 for x in data['display']['head'][k]]
        data['display']['head']['translation'][1] = data['display']['head']['translation'][1]-14.664
        print('')
        print(data)
# print(onlyfiles)