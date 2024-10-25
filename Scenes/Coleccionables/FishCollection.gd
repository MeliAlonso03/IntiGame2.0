extends Area2D
class_name Collection

@onready var player = $"../CharacterBody2D"
@onready var sonido_agarrar_fish = $SonidoAgarrarFish



func _ready():
	connect("area_entered", Callable(self, "_on_area_entered"))

func _process(delta):
	pass

func _on_area_entered(area):
	if area.name == "CatArea2D":
		sonido_agarrar_fish.play()
		sonido_agarrar_fish.connect("finished", Callable(self, "_on_sound_finished"))  # Conectar la señal
		_action_with_cat()
		
		

func _action_with_cat():
	player.point_suma()  # Llama a point_suma() en el Player existente

func _on_sound_finished():
	queue_free()  # Liberar el nodo solo después de que el sonido haya terminado
