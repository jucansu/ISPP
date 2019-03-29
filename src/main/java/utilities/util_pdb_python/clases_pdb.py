from util.metodos_pdb import *


class UserAccount:

    def __init__(self, _id, auth, uname):
        self.id = _id
        self.authority = auth
        self.username = uname

    def __str__(self):
        return get_user_account(self.id, self.authority, self.username)


class Passenger:

    def __init__(self, _id, name=False, surname=False, reservations=[]):
        self.id = _id
        self.name = name
        self.surname = surname
        self.reservations = reservations
        self.comments = []

    def __str__(self):
        return get_passenger(self.id, nombre=self.name, apellidos=self.surname, reservations=self.reservations,
                             comments=self.comments)


class Driver:

    def __init__(self, _id, name=False, surname=False, routes=[]):
        self.id = _id
        self.name = name
        self.surname = surname
        self.routes = routes
        self.comments = []
        self.vehicles = []

    def __str__(self):
        return get_driver(self.id, nombre=self.name, apellido=self.surname, routes=self.routes, comments=self.comments,
                          vehicles=self.vehicles)


class Vehicle:

    def __init__(self, _id, _type, rutas=[]):
        self.id = _id
        self.driver_id = _id
        self.type = _type
        self.seats = 5 if self.type == "CAR" else 2
        self.routes = rutas

    def __str__(self):
        return get_vehicle(self.id, self.driver_id, self.type, self.routes)


class Route:

    def __init__(self, _id, driver_id, vtype="CAR"):
        self.id = _id

        locations = random.sample(streets_list, 2)
        self.origin = locations[0]
        self.destination = locations[1]
        self.driver_id = driver_id
        self.equipaje = random.choice(equipaje_list)

        self.vehicle_id = driver_id
        self.vehicle_type = vtype
        self.reserves = []

    def __str__(self):
        return get_route(self.id, self.origin, self.destination, self.driver_id, self.vehicle_id,
                         is_car=True if self.vehicle_type == "CAR" else False, equipaje=self.equipaje,
                         reserves=self.reserves)


class Reservation:

    def __init__(self, _id, passenger_id, route_obj, status="PENDING"):
        self.id = _id
        self.passenger_id = passenger_id
        self.route_id = route_obj.id
        self.route = route_obj
        self.status = status

    def __str__(self):
        return get_reservation(self.id, self.passenger_id, self.route, status=self.status)
