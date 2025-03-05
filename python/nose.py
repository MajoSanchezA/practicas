import os
import random
import time

# Colores y formato
GREN = "\033[32m"
PURPLE = "\033[32m"
RED = "\033[31m"
BLUE = "\033[32m"
CYAN = "\033[32m"
WHITE = "\033[37m"
END = "\033[0m"
CLEAR_LINE = "\033[K"

def limpiar_pantalla():
    os.system("cls" if os.name == "nt" else "clear")

def generar_bus(posicion, nombre, color, mensaje="", meta_color=WHITE):
    nombre = nombre.ljust(11)
    bus = []

    # Generamos el bus con su avance y el mensaje en el carril
    bus.append((posicion * " ") + f"{color} _______________  {END}" + f"{color}{mensaje}{END}")
    bus.append((posicion * " ") + f"{color}|__|__|__|__|__|___{END}")
    bus.append((posicion * " ") + f"{color}|   {nombre}   |){END}")
    bus.append((posicion * " ") + f"{color}|~~~@~~~~~~~~~@~~~|{END}")
    
    # Línea divisoria al final (que será verde cuando llegue el ganador)
    bus.append((posicion * " ") + f"{meta_color}{'=' * 20}{END}")  # Línea divisoria
    return bus

def imprimir_buses(n1, n2, mensaje1="", mensaje2="", meta_color=WHITE):
    output = []
    output.append(115 * "-")  # Línea divisoria superior
    output.extend(generar_bus(n1, "SOBUSA", f"{RED}{PURPLE}", mensaje1, meta_color if n1 >= 97 else WHITE))
    output.append(115 * "_")  # Línea divisoria entre los dos carriles
    output.extend(generar_bus(n2, "COOLITORAL", f"{BLUE}{CYAN}", mensaje2, meta_color if n2 >= 97 else WHITE))
    output.append(115 * "-")  # Línea divisoria inferior
    return "\n".join(output)

def carrera():
    a = 0
    b = 0
    distance = 97  # Distancia total que debe recorrer cada bus
    tiempo_inicio = time.time()
    tiempo_para_carrera = 25.0  # Duración exacta de la carrera

    # Mostrar el mensaje "Carrera de buses!" 3 veces durante 3 segundos
    for _ in range(3):
        limpiar_pantalla()
        print(imprimir_buses(0, 0, mensaje1="Carrera de buses!", mensaje2="Carrera de buses!"))
        time.sleep(1)  # Cada mensaje dura 1 segundo

    # Mostrar el mensaje "WUUJUUJUU!" 4 veces durante 2 segundos
    for _ in range(4):
        limpiar_pantalla()
        print(imprimir_buses(0, 0, mensaje1="WUUJUUJUU!", mensaje2="WUUJUUJUU!"))
        time.sleep(0.5)  # Cada mensaje dura 0.5 segundos

    # Carrera con mensajes especiales y parpadeo
    toggle_mensaje = True
    tiempo_inicio_parpadeo = time.time()
    meta_color = WHITE  # Color inicial de la línea divisoria (blanco)

    while a < distance and b < distance:
        avance = random.randint(1, 2)
        if avance == 1:
            a += 1
        else:
            b += 1

        limpiar_pantalla()

        # Parpadeo de los mensajes cada 0.5 segundos
        if time.time() - tiempo_inicio_parpadeo >= 0.5:
            toggle_mensaje = not toggle_mensaje
            tiempo_inicio_parpadeo = time.time()

        tiempo_actual = time.time() - tiempo_inicio

        # Cambiar el mensaje de los carriles según el tiempo
        if 7 <= tiempo_actual < 13.5:
            mensaje1 = "TUTUTUTUT "
            mensaje2 = "RAPIDOOOOOOOOOOO!!"
        elif tiempo_actual >= 13.5 and tiempo_actual < 17:
            mensaje1 = "La SALIDA , LA SALIDAAA"
            mensaje2 = "PIPIPIPPPP"
        elif tiempo_actual >= 17 and tiempo_actual < 20:
            mensaje1 = "*QUITENSE DE ESA MONDA!!"
            mensaje2 = "*MAS RAPIDO!!"
        elif tiempo_actual >= 23 and tiempo_actual < 24:
            mensaje1 = "WUUUUUUH"
            mensaje2 = "WUUUUUUH"
        elif tiempo_actual >= 26:
            mensaje1 = "¿Quién ganará?" if toggle_mensaje else "            "
            mensaje2 = "¿Quién ganará?" if toggle_mensaje else "            "
        else:
            mensaje1 = mensaje2 = ""  # Sin mensaje cuando no se cumple ninguna condición de tiempo

        # Cambiar el color de la línea divisoria a verde cuando alguno de los buses termine
        if a >= distance or b >= distance:
            meta_color = GREN  # Cambia la línea divisoria a verde

        # Imprimir los buses y la línea divisoria
        print(imprimir_buses(a, b, mensaje1=mensaje1, mensaje2=mensaje2, meta_color=meta_color))

        tiempo_restante = tiempo_para_carrera - (time.time() - tiempo_inicio)
        if tiempo_restante <= 0:
            break
        time.sleep(tiempo_restante / (distance - max(a, b)))  # Ajusta el tiempo entre cada avance

    # Determinar el ganador
    if a > b:
        ganador = "SOBUSA"
    elif b > a:
        ganador = "COOLITORAL"
    else:
        ganador = random.choice(["SOBUSA", "COOLITORAL"])
    print(f"{GREN}GANÓ LA CARRERA: {ganador}{END}")
# Ejecuta la carrera
carrera()