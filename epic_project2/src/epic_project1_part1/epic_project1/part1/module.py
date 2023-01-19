
from epic_project1.domain import Service, Entity1

class ServicePart1(Service):

    def run(self):
        print(f'example service : {type(self).__name__}')

    def process(self, entity: Entity1):
        print(entity)


def run():
    print(__file__)

