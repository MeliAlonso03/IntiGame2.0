extends AnimatedSprite2D

@onready var flores_2 = $"."
var status : bool = false



func _on_area_2d_area_entered(area):
	if area.name == "CatArea2D":
		verificar_status_animacion()

func verificar_status_animacion():
	if status == false:
		flores_2.play("Romper")
		status = true
