extends StaticBody2D

# Nodo hijo CollisionShape2D
@export var shape : CollisionShape2D

func _ready():
	shape = $CollisionShape2D
