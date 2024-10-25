extends Control
class_name playerInterface


@onready var score_2 = $VBoxContainer/background/HBoxContainer/Score2


func _ready():
	pass 


func _process(delta):
	pass

func actualizarInterface(point) -> void:
	score_2.text = str(point)

