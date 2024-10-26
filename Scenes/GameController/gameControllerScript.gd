extends Node2D

@onready var character_body_2d = $"../CharacterBody2D"


func playResult():
	var nueva_escena = preload("res://Scenes/Menu/GameOver.tscn").instantiate()
	
	# Imprimir el valor para verificar si es correcto
	print("Puntos del jugador:", character_body_2d.point)
	
	if character_body_2d.point < 3:
		nueva_escena.set_resultado_partida("¡No agarraste los pescaditos!")
	else:
		nueva_escena.set_resultado_partida("¡Ganaste!")
	crear_nueva_escena(nueva_escena)


func crear_nueva_escena(nueva_escena):
	get_tree().root.add_child(nueva_escena)
	get_tree().current_scene.queue_free()
	get_tree().current_scene = nueva_escena


