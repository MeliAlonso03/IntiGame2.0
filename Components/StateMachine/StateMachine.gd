extends Node
##StateMachine Version 1.0
class_name StateMachine

##The node that we are going to control, for example the player
@onready var node_to_control = self.owner

##The initial state of the state machine 
@export_node_path('Node') var initial_state
@onready var state = get_node(initial_state)

## DEBUG
@export var DEBUG : bool = true
@export var ACTIVATE_HISTORY : bool = false
@export var PRINT_HISTORY : bool = false
var history:Array[String] = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Allow for all nodes to be ready before calling _enter_state
	call_deferred("_enter_state")
	pass

func _enter_state():
	if DEBUG:
		print(owner.name, ": Entering State: ", state.name)
		
	#We add node to control to the child nodes
	state.node = node_to_control
	
	state_history()
	
	#We add this state machine to the child nodes
	state.state_machine = self
	state.enter()
	
func change_to(name_of_new_state:String):
	###Con el siguiente codigo cambiamos el estado anterior a uno nuevo
	state = get_node(name_of_new_state)
	_enter_state()   #asignamos variables al nuevo estado

##add and show the history of the states in an array
func state_history():
	if ACTIVATE_HISTORY:
		history.append(state.name)
		
	if PRINT_HISTORY:
		print(history)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if state.has_method("process"):
		state.process(delta)
		

func _physics_process(delta):
	if state.has_method("physics_process"):
		state.physics_process(delta)

func _input(event):
	if state.has_method("input"):
		state.input(event)
		

func _unhandled_input(event):
	if state.has_method("unhandled_input"):
		state.unhandled_input(event)
		

func _unhandled_key_input(event):
	if state.has_method("unhandled_key_input"):
		state.unhandled_key_input(event)
