extends Control

var sonidoFondo = preload("res://Scenes/Music/sounds/SonidoDeFondo.mp3")

func _ready():
	change_sound(sonidoFondo)



func _on_jugar_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/level1.tscn")


func _on_salir_pressed():
	get_tree().quit()

func change_sound(sound):
	BocinaDeFondo.stream = sound
	BocinaDeFondo.play()



func _on_check_button_toggled(toggled_on):
	if toggled_on == true:
		change_sound(sonidoFondo)
	else:
		BocinaDeFondo.stop()
