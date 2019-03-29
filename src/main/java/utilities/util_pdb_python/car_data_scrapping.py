from bs4 import BeautifulSoup
import requests
import numpy

BASE_URL = "https://www.dieselogasolina.com/cuanto-consume-coche-a-los-100-km.html"


def main():
    r = requests.get(BASE_URL)
    soup = BeautifulSoup(r.text, 'html.parser')

    all_urls = [link.get("href") for link in soup.find_all('a')]
    urls_marcas = list(filter(lambda x: "Consumos/Modelos/" in x, all_urls))

    print("Marcas a analizar:", len(urls_marcas))
    # print(*urls_marcas, sep="\n")

    datos_por_marca = []
    len_datos_year = 0
    len_modelos = 0

    for i, url_marca in enumerate(urls_marcas):
        marca = url_marca.split("/")[-1]

        print(i + 1, ' ', marca.upper())

        r = requests.get(url_marca)
        soup = BeautifulSoup(r.text, 'html.parser')

        all_urls = [link.get("href") for link in soup.find_all('a')]
        urls_years = list(set(filter(lambda x: x and "ModelosByYear/" in x, all_urls)))
        urls_years.sort()

        datos_por_year = []

        for j, url_year in enumerate(urls_years):
            year = url_year.split("/")[-1]

            print("    ", j + 1, ' ', year)

            r = requests.get(url_year)
            soup = BeautifulSoup(r.text, 'html.parser')

            all_urls = [link.get("href") for link in soup.find_all('a')]
            urls_modelos = list(set(filter(lambda x: x and "Versiones/" in x, all_urls)))

            datos_por_modelo = []

            for k, url_modelo in enumerate(urls_modelos):
                modelo = url_modelo.split('/')[-2]

                # print("    " * 2, k + 1, ' ', modelo)

                r = requests.get(url_modelo)
                soup = BeautifulSoup(r.text, 'html.parser')

                aux = soup.find('ol')
                if not aux:
                    break

                all_lis = aux.find_all('li')

                n = 0
                ciudad = 0
                carretera = 0
                mixto = 0

                for z, li in enumerate(all_lis):
                    # columnas = list(map(lambda x: x.text, li.find('thead').find_all('th')))
                    datos = list(
                        map(lambda y: float(y.split()[0]), map(lambda x: x.text, li.find('tbody').find_all('td'))))

                    ciudad += datos[0]
                    carretera += datos[1]
                    mixto += datos[2]

                    n += 1

                    # print("    " * 3, z + 1, ' ', *columnas)
                    # print("    " * 3, z + 1, ' ', *datos)

                if n != 0:
                    media_ciudad = ciudad / n
                    media_carretera = carretera / n
                    media_mixto = mixto / n

                    datos_por_modelo.append((modelo, media_ciudad, media_carretera, media_mixto))
                    # print("    " * 3, *datos_por_modelo[-1])

            len_modelos += len(datos_por_modelo)

            all_ciudad_aux = [x[1] for x in datos_por_modelo]
            all_carretera_aux = [x[2] for x in datos_por_modelo]
            all_mixto_aux = [x[3] for x in datos_por_modelo]

            media_ciudad = numpy.mean(all_ciudad_aux)
            media_carretera = numpy.mean(all_carretera_aux)
            media_mixto = numpy.mean(all_mixto_aux)
            datos_por_year.append((year, media_ciudad, media_carretera, media_mixto))
            # print("    " * 3, *datos_por_year[-1])

        len_datos_year += len(datos_por_year)

        all_ciudad_aux = [x[1] for x in datos_por_year]
        all_carretera_aux = [x[2] for x in datos_por_year]
        all_mixto_aux = [x[3] for x in datos_por_year]

        media_ciudad = numpy.mean(all_ciudad_aux)
        media_carretera = numpy.mean(all_carretera_aux)
        media_mixto = numpy.mean(all_mixto_aux)
        datos_por_marca.append((marca, media_ciudad, media_carretera, media_mixto))
        print('    ' * 2, *datos_por_marca[-1])

    all_ciudad_aux = [x[1] for x in datos_por_marca]
    all_carretera_aux = [x[2] for x in datos_por_marca]
    all_mixto_aux = [x[3] for x in datos_por_marca]

    media_ciudad = numpy.mean(all_ciudad_aux)
    media_carretera = numpy.mean(all_carretera_aux)
    media_mixto = numpy.mean(all_mixto_aux)

    print("------------ TOTAL ------------")
    print("Media ciudad:", media_ciudad)
    print("Media carretera:", media_carretera)
    print("Media mixto:", media_mixto)

    print("MARCAS:", len(datos_por_marca))
    print("AÑOS:", len_datos_year)
    print("MODELOS:", len_modelos)


if __name__ == '__main__':
    main()
