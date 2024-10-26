extends Node2D
@onready var button_2 = $VBoxContainer/Button2
@onready var button = $VBoxContainer/Button



func set_resultado_partida(resultado: String):
		var label = $VBoxContainer/Label2
		var button_2 = $VBoxContainer/Button2  # Asegúrate de que esta sea la ruta correcta del botón

		print("estoy en el metodo")
		if button_2 == null:
			print("Botón 2 no encontrado en la escena.")
	
		label.text = resultado
	
		if resultado == "¡No agarraste los pescaditos!":
			button_2.visible = false  # Hacer que el botón no sea visible si perdiste
		else:
			button_2.visible = true  # Mostrar el botón si ganaste

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/level1.tscn")

func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/level2.tscn")
