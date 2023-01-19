from epic_project1.domain import Service, Entity1

from epic_project1.main.deps import build_injector, build_injector1, build_injector2, Service1, Service2

def run():
    print("example defining what type of service to inject by type alias")
    injector = build_injector()
    service1 = injector.get(Service1)
    print(type(service1))

    service2 = injector.get(Service2)
    print(type(service2))

    e1 = Entity1(field1="test1", field2="test2")
    service1.process(e1)
    service2.process(e1)


def runX(injector):
    print("example injecting the implementation from a service")
    service = injector.get(Service)
    print(type(service))
    e1 = Entity1(field1="test1", field2="test2")
    service.process(e1)




if __name__ == "__main__":
    run()
    runX(build_injector1())
    runX(build_injector2())