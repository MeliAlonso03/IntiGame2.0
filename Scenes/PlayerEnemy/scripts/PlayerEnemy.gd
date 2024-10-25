extends CharacterBody2D

@export var speed_scape: float = 100.0
@export var animated_sprite: AnimatedSprite2D
@export var shape : CollisionShape2D
@onready var game_controller = $"../GameController"

#var fin = false
var power_up_active = false
var escaping = false  # Indica si el ratón está escapando
var escape_direction: Vector2 = Vector2.ZERO  # Dirección de escape

func _ready():
	animated_sprite = $AnimatedSprite2D
	connect("area_entered", Callable(self, "_on_area_collision_raton_area_entered"))
	connect("area_exited", Callable(self, "_on_area_collision_raton_area_exited"))
	connect("area_entered", Callable(self, "_on_area_atrapar_raton_area_entered"))
	shape = $CollisionShape2D

func _process(delta):
	handle_screen_limits()
	if escaping:
		move_character(delta)
	update_animation()

func move_character(delta):
	var motion = (velocity * delta)*2
	var collision = move_and_collide(motion)
	if collision:
		velocity = Vector2.ZERO  # Detener el movimiento en caso de colisión

func handle_screen_limits():
	var screen_rect = get_viewport_rect()
	
	# Ajustar la posición si está fuera de los límites de la pantalla
	if position.x < screen_rect.position.x:
		position.x = screen_rect.position.x
		velocity.x = 0
	elif position.x > screen_rect.position.x + screen_rect.size.x:
		position.x = screen_rect.position.x + screen_rect.size.x
		velocity.x = 0

	if position.y < screen_rect.position.y:
		position.y = screen_rect.position.y
		velocity.y = 0
	elif position.y > screen_rect.position.y + screen_rect.size.y:
		position.y = screen_rect.position.y + screen_rect.size.y
		velocity.y = 0

func update_animation():
	if velocity.length() == 0:
		animated_sprite.play("idle")
	else:
		if abs(velocity.x) > abs(velocity.y):
			if velocity.x > 0:
				animated_sprite.play("walk_right")
			else:
				animated_sprite.play("walk_left")
		else:
			if velocity.y > 0:
				animated_sprite.play("walk_down")
			else:
				animated_sprite.play("walk_up")

# Cuando el gato entra en el área del ratón
func _on_area_collision_raton_area_entered(area):
	if area.name == "CatArea2D":
		escaping = true  # El ratón empieza a escapar
		update_escape_direction(area)


func update_escape_direction(area):
	# Calcular la dirección opuesta al gato
	escape_direction = (self.global_position - area.global_position).normalized()
	velocity = escape_direction * speed_scape

# Cuando el gato atrapa al ratón
func _on_area_atrapar_raton_area_entered(area):
	if area.name == "CatArea2D":
		game_controller.playResult()
		queue_free()
		print("Ratón atrapado. Redirigiendo a otra escena...")
		



func _on_area_mover_raton_area_exited(area):
	if area.name == "CatArea2D":
		escaping = false  # El ratón deja de escapar
		
