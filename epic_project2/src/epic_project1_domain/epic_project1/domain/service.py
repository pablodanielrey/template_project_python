from abc import ABC, abstractmethod

from epic_project1.domain.entities import Entity1

class Service(ABC):

    @classmethod
    def run(self):
        ...

    @classmethod
    def process(self, entity: Entity1):
        ...