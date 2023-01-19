import injector
from injector import Injector

from epic_project1.domain import Service
from epic_project1.part1.module import ServicePart1
from epic_project1.part2.module import ServicePart2

Service1 = Service
Service2 = Service


def build_injector() -> Injector:
    injector = Injector()
    injector.binder.bind(Service1, to=ServicePart1)
    injector.binder.bind(Service2, to=ServicePart2)

    return injector


def build_injector1() -> Injector:
    injector = Injector()
    injector.binder.bind(Service, to=ServicePart1)

    return injector    

def build_injector2() -> Injector:
    injector = Injector()
    injector.binder.bind(Service, to=ServicePart2)

    return injector    