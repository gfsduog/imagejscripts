from logging import basicConfig, INFO
from math import prod
from os.path import basename
from sys import argv


def main():
    del argv[0]
    if not argv:
        print('No input images specified')
        return
    basicConfig(level=INFO)
    print('Loading Cellpose')
    from cellpose.models import Cellpose
    from cellpose.io import imread
    with open('out.csv', 'w') as f:
        f.write('well,confluence\n')
        for well, flows in zip(argv, Cellpose(True).eval(list(map(imread, argv)), diameter=None)[1]):
            flows = flows[2]
            f.write(f'{basename(well)},{(flows>0).sum() / prod(flows.shape)}\n')


if __name__ == '__main__':
    main()
