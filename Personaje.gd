extends Node2D

# Definimos quiénes son los personajes
enum Personaje { AMANDA, WOOLY, SCRATCH }
var personaje_actual = Personaje.AMANDA

# Referencias a elementos visuales (debes crearlos en tu escena)
@onready var etiqueta_nombre = $CanvasLayer/NombrePersonaje
@onready var fondo_pantalla = $CanvasLayer/ColorRect

func _ready():
	actualizar_interfaz()

func _input(event):
	# Al presionar la tecla "C", cambiamos de personaje
	if event.is_action_just_pressed("ui_accept"): # Por defecto es la tecla ESPACIO o ENTER
		cambiar_siguiente_personaje()

func cambiar_siguiente_personaje():
	# Lógica circular: Amanda -> Wooly -> Scratch -> Amanda
	match personaje_actual:
		Personaje.AMANDA:
			personaje_actual = Personaje.WOOLY
		Personaje.WOOLY:
			personaje_actual = Personaje.SCRATCH
		Personaje.SCRATCH:
			personaje_actual = Personaje.AMANDA
	
	actualizar_interfaz()

func actualizar_interfaz():
	# Cambiamos lo que ves en pantalla según el personaje elegido
	match personaje_actual:
		Personaje.AMANDA:
			etiqueta_nombre.text = "Jugando como: AMANDA"
			fondo_pantalla.color = Color.YELLOW # Color característico de Amanda
			print("¡Vamos a una aventura!")
		Personaje.WOOLY:
			etiqueta_nombre.text = "Jugando como: WOOLY"
			fondo_pantalla.color = Color.BLUE # Color del villano Wooly
			print("Wooly está nervioso...")
		Personaje.SCRATCH:
			etiqueta_nombre.text = "Jugando como: SCRATCH"
			fondo_pantalla.color = Color.ORANGE # Color de Chicken Scratch
			print("Scratch está observando.")
