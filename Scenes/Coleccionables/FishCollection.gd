extends Area2D
class_name Collection

@onready var sonido_agarrar_fish = $SonidoAgarrarFish



func _ready():
	connect("area_entered", Callable(self, "_on_area_entered"))

func _process(delta):
	pass

func _on_area_entered(area):
	if area.name == "CatArea2D":
		sonido_agarrar_fish.play()
		sonido_agarrar_fish.connect("finished", Callable(self, "_on_sound_finished"))  # Conectar la señal
		area.get_parent().point_suma()



func _on_sound_finished():
	queue_free()  # Liberar el nodo solo después de que el sonido haya terminado
