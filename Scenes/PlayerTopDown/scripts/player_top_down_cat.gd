extends CharacterBody2D
class_name Player


@onready var state_machine: StateMachine = $StateMachine as StateMachine
var states:PlayerStates = PlayerStates.new()

@onready var animation_player: AnimationPlayer = $AnimationPlayer
var animations: PlayerAnimations = PlayerAnimations.new()
@export var current_animation:String = animations.idle_none

var directions:PlayerDirections = PlayerDirections.new()
@export var current_direction:PlayerDirection = directions.none

@onready var urm_2d: URM2D = $URM2D
var input_direction:Vector2
@onready var hud = $CanvasLayer/Hud



var point: int = 0



func point_suma() -> int:
	point +=1
	print("Puntos actuales: ", point)
	hud.actualizarInterface(point)
	return point
