extends Area2D
class_name Collection

@onready var sonido_agarrar_fish = $SonidoAgarrarFish

var status : bool = false

func _ready():
	connect("area_entered", Callable(self, "_on_area_entered"))


func _on_area_entered(area):
	if area.name == "CatArea2D":
		verificar_status(area)
		sound_fish()
#		area.get_parent().point_suma()

func verificar_status(area):
	if status == false:
		area.get_parent().point_suma()
		status = true
	else:
		print ("Ya agarraste el pescadito")

func sound_fish():
	sonido_agarrar_fish.play()
	sonido_agarrar_fish.connect("finished", Callable(self, "_on_sound_finished"))  # Conectar la señal

func _on_sound_finished():
	queue_free()  # Liberar el nodo solo después de que el sonido haya terminado
