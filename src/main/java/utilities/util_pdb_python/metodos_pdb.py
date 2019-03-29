import random

from util.datos_ejemplo import *
from util.plantillas import *


def get_car(_id):
    return plantilla_vehiculo.format(id=_id)


def get_user_account(_id, authority, email=False):
    # ADMIN, PASSENGER, DRIVER
    return plantilla_user_account.format(id=_id,
                                         username=email if email else authority.lower() + str(_id) + "@gmail.com",
                                         authority=authority)


def rand_bool():
    return random.choice(["true", "false"])


def get_driver(_id, nombre=False, apellido=False, dinero=100.0, routes=[], comments=[], vehicles=[]):
    if routes:
        routes = '\n'.join(['<ref bean="route{}"/>'.format(r) for r in routes])
    else:
        routes = ""

    if comments:
        comments = '\n'.join(['<ref bean="comment{}"/>'.format(r) for r in comments])
    else:
        comments = ""

    if vehicles:
        vehicles = '\n'.join(['<ref bean="vehicle{}"/>'.format(r) for r in vehicles])
    else:
        vehicles = ""

    return plantilla_driver.format(id=_id, nombre=nombre if nombre else random.choice(names_list),
                                   apellido=apellido if apellido else random.choice(surnames_list),
                                   telefono=random.randint(10000000, 100000000), dinero=dinero,
                                   banco=random.randint(1000000000000000000000, 10000000000000000000000),
                                   mascotas=rand_bool(), fumar=rand_bool(), musica=rand_bool(), niños=rand_bool(),
                                   id_us_acc=_id, routes=routes, comments=comments, vehicles=vehicles)


def get_passenger(_id, nombre=False, apellidos=False, dinero=100.0, reservations=[], comments=[]):
    if reservations:
        reservations = '\n'.join(['<ref bean="reservation{}"/>'.format(r) for r in reservations])
    else:
        reservations = ""

    if comments:
        comments = '\n'.join(['<ref bean="comment{}"/>'.format(c) for c in comments])
    else:
        comments = ""

    return plantilla_passenger.format(id=_id, nombre=nombre if nombre else random.choice(names_list),
                                      apellido=apellidos if apellidos else random.choice(surnames_list),
                                      telefono=random.randint(10000000, 100000000), dinero=dinero,
                                      banco=random.randint(1000000000000000000000, 10000000000000000000000),
                                      reservation_ids=reservations, comment_ids=comments)


def get_route(_id, origen, destino, id_driver, id_vehiculo, is_car=True, equipaje=random.choice(equipaje_list),
              reserves=[]):
    days_repeat = random.choice(days_list)

    if reserves:
        reserves = '\n'.join(['<ref bean="reservation{}"/>'.format(r) for r in reserves])
    else:
        reserves = ""

    seats = 1 if not is_car else 4

    return plantilla_route.format(id=_id, dia=random.randint(1, 28), mes=random.randint(1, 13),
                                  hora=random.randint(6, 24), minutos=random.randint(0, 61), origen=origen,
                                  destino=destino, duration=random.randint(10, 61), days_repeat=days_repeat,
                                  seats=seats, distancia=random.randint(3, 11), equipaje=equipaje,
                                  id_driver=id_driver, id_vehiculo=id_vehiculo, reserves=reserves)


def crear_usuarios_piloto():
    all = []

    for nombre, email, rol in zip(nombres_usuarios, usuarios, roles):
        aux = nombre.split(' ')
        nombre = aux[0]
        apellidos = ' '.join(aux[1:])

        all.append((rol, email, nombre, apellidos))

    all.sort(key=lambda x: x[0])

    i = 100
    for u in all:
        rol, email, nombre, apellidos = u
        authority = "PASSENGER" if rol == "Pasajero" else "DRIVER"

        # Creamos el userAccount
        print(get_user_account(i, authority, email))

        if authority == "PASSENGER":
            # Creamos el passenger asociado

            print(get_passenger(i, nombre, apellidos))

        else:
            # Creamos el driver asociado

            print(get_driver(i, nombre, apellidos))

            # Creamos el vehiculo del driver

            print(get_car(i))

        i += 1


def get_vehicle(_id, driver_id, _type, routes=[]):
    if routes:
        routes = '\n'.join(['<ref bean="route{}"/>'.format(r) for r in routes])
    else:
        routes = ""

    plate = "AB1234XY"

    car = ["Clio", "Renault",
           "https://cdn.topgear.es/sites/navi.axelspringer.es/public/styles/main_element/public/filefield_paths/"
           "nuevo-renault-clio-2019.jpg?itok=2CUAvi6l", 5, "CAR"]

    bike = ["Agility", "Kymco",
            "https://www.motofichas.com//images/phocagallery/Kwang_Yang_Motor_Co/Agility_City"
            "_125_2016/01-kymco-agility-city-125-2016-estatica.jpg", 2, "BIKE"]

    if _type == "BIKE":
        aux = bike
    else:
        aux = car

    model, brand, image, seats, _type = aux

    return plantilla_vehiculo.format(id=_id, model=model, brand=brand, image=image, seats=seats, type=_type,
                                     plate=plate,
                                     driver_id=driver_id, routes=routes)


def get_reservation(_id, passenger_id, route_obj, status="PENDING"):
    luggage = route_obj.equipaje
    seat = 1
    price = 1.1
    origin = route_obj.origin
    destination = route_obj.destination
    route_id = route_obj.id

    return plantilla_reservation.format(id=_id, luggage=luggage, price=price, origin=origin, destination=destination,
                                        seat=seat, status=status, passenger_id=passenger_id, route_id=route_id)
