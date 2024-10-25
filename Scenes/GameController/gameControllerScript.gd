extends Node2D

@onready var character_body_2d = $"../CharacterBody2D"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func playResult():
	var nueva_escena = preload("res://Scenes/Menu/GameOver.tscn").instantiate()
	
	# Imprimir el valor para verificar si es correcto
	print("Puntos del jugador:", character_body_2d.point)
	
	if character_body_2d.point < 3:
		nueva_escena.set_resultado_partida("¡No agarraste los pescaditos!")
	else:
		nueva_escena.set_resultado_partida("¡Ganaste!")
	
	# Asegurarte de no añadir varias veces la misma escena
	get_tree().root.add_child(nueva_escena)
	get_tree().current_scene.queue_free()
	get_tree().current_scene = nueva_escena


