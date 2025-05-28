extends Marker2D
var dir = 8
var enemy_quantity = 1
var Enemy = preload("res://scene/enemy/enemy_spider/enemy_spider.tscn")
func _physics_process(delta: float) -> void:
	position.x += dir 



func _on_timer_timeout() -> void:
	dir *= -1


func _on_spawn_timer_timeout() -> void:
	for i in range(enemy_quantity):
		await get_tree().create_timer(0.2).timeout
		var enemy = Enemy.instantiate()
		enemy.global_position = global_position
		get_parent().get_parent().add_child(enemy)
