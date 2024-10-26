extends Node
##Uniform Rectilinear Motion 2D
##Version 1.1
class_name URM2D

@export var speed:float = 200 #rapidez
@export var direction_2D:Vector2 = Vector2.ZERO
@export var normalized:bool = true #para preguntar si se va a normalizar el valor
@export var character:CharacterBody2D #El objet que se va a mover
@export var can_move:bool = true #detener el movimiento



func get_velocity() -> Vector2:
	if normalized:
		direction_2D = direction_2D.normalized()
	print(direction_2D)
	return direction_2D * speed
	

#funcion para mover la escena desde otro nodo
func move():
	if can_move: #el nodo puede moverse?
		character.velocity = get_velocity()
		character.move_and_slide()  #el metodo sirve para mover el nodo characterBody2d
	else:
		character.velocity = Vector2.ZERO

func stop_movement(_can_move:bool = true):
	can_move = _can_move




