extends AnimatedSprite2D

@onready var flores_2 = $"."



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	if area.name == "CatArea2D":
		flores_2.play("Romper")