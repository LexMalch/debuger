extends Node2D

var speed: float = 200.0  # Скорость пули
var direction: Vector2 = Vector2.RIGHT  # Направление движения (можно задавать при создании)




func _physics_process(delta: float) -> void:
	# Перемещаем пулю в заданном направлении
	position += direction.normalized() * speed * delta
	


func _on_timer_timeout() -> void:
	queue_free()




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemys"):
		body.get_damage(Globals.turret_damage)
		queue_free()
