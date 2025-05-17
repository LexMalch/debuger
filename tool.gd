extends Node2D
@export var radius = 15  # Расстояние от игрока
@export var rotation_speed = 10  # Скорость поворота (для плавности)

@onready var player = get_parent()  # Родительская нода (игрок)
@onready var item = %Tool  # Нода предмета (Sprite или другое)


func _physics_process(delta: float) -> void:
	# Получаем позицию мыши в глобальных координатах
	var mouse_pos = get_global_mouse_position()
	
	# Вычисляем направление от игрока к мыши
	var direction = (mouse_pos - player.global_position).normalized()
	
	# Устанавливаем позицию предмета на расстоянии radius от игрока в направлении мыши
	var target_position = direction * radius
	
	item.position = target_position
	
	
	if player.global_position.x < item.global_position.x:
		item.rotation = direction.angle() + deg_to_rad(10)
	else:
		item.rotation = direction.angle() + deg_to_rad(180) + deg_to_rad(10)
		
	
