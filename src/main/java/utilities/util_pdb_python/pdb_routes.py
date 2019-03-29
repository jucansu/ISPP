import random
from util.plantillas import *
from util.datos_ejemplo import *
from util.metodos_pdb import *
from util.clases_pdb import *


def main():
    user_accounts = []
    passengers = []
    drivers = []
    vehicles = []
    routes = []
    reservations = []
    route_reservation = []

    # 30 drivers
    i_ruta = 1
    for i in range(1, 31):
        n_rutas = range(i_ruta, i_ruta + random.randint(0, 3) + 1)

        user_account = UserAccount(i, "DRIVER", "driver{}@gmail.com".format(i))

        driver = Driver(i)
        vehicle = Vehicle(i, "CAR" if random.random() > 0.25 else "BIKE")

        for _ in n_rutas:
            route = Route(i_ruta, i, vehicle.type)
            routes.append(route)
            i_ruta += 1

        # Actualización de listas
        user_accounts.append(user_account)
        drivers.append(driver)
        vehicles.append(vehicle)

    # 70 drivers
    i_reservation = 1
    for j in range(31, 101):
        n_reservations = range(i_reservation, i_reservation + random.randint(0, 2) + 1)

        user_account = UserAccount(j, "PASSENGER", "passenger{}@gmail.com".format(j))

        passenger = Passenger(j)

        user_accounts.append(user_account)
        passengers.append(passenger)

        for _ in n_reservations:
            idx_route = random.randint(0, len(routes) - 1)
            route_reservation.append((idx_route, i_reservation - 1))

            reservation = Reservation(i_reservation, j, routes[idx_route])
            # routes[idx_route].reserves.append(i_reservation)

            reservations.append(reservation)

            i_reservation += 1

    for i in range(len(routes)):
        # Todas las reservas para esta ruta
        reservations_aux = [a for a, b in filter(lambda x: x[0] == i, route_reservation)]

        route = routes[i]
        reserved = 0
        max = 4 if route.vehicle_type == "CAR" else 1

        for idx_r in reservations_aux:

            if reserved <= max and random.random() < 0.15:
                reserved += 1
                reservations[idx_r].status = "ACCEPTED"
            elif random.random() < 0.35:

                if random.random() < 0.5:
                    reservations[idx_r].status = "CANCELLED"
                else:
                    reservations[idx_r].status = "REJECTED"

    print("<!-- USERACCOUNTS ({}) -->".format(len(user_accounts)))
    for user_account in user_accounts:
        print(user_account)

    print("<!-- DRIVERS ({}) -->".format(len(drivers)))
    for driver in drivers:
        print(driver)

    print("<!-- PASSENGERS ({}) -->".format(len(passengers)))
    for passenger in passengers:
        print(passenger)

    print("<!-- VEHICLES ({}) -->".format(len(vehicles)))
    for vehicle in vehicles:
        print(vehicle)

    print("<!-- ROUTES ({}) -->".format(len(routes)))
    for route in routes:
        print(route)

    print("<!-- RESERVATIONS ({}) -->".format(len(reservations)))
    for reservation in reservations:
        print(reservation)


if __name__ == "__main__":
    main()
