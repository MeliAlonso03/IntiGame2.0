extends Resource
class_name Direction2D

#Para guargar los datos en una base de datos
@export var _name:String
#Vector 2d, para mover al jugador
@export var _vector_2d:Vector2
#util para verificar angulos
@export var _angle:float = 0

##Recibimos los datos y se los asignamos a nuestra clase
func setup(name:String, vector_direction:Vector2, angle:float=0):
	_name = name
	_vector_2d = vector_direction
	_angle = angle



