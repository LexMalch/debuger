extends StaticBody2D
var building_sprite= preload("res://scene/turret/sprite/turret.png")
var price = 0
var damage = 1
var max_health = 10
var targets= []
var current_target
var Bullet_scene = preload("res://scene/bullet/bullet.tscn")
@onready var health = max_health


func _physics_process(delta: float) -> void:
	$ProgressBar.max_value = max_health
	$ProgressBar.value = health
	if current_target:
		$Turret_tower.look_at(current_target.global_position)
		$Turret_tower.rotate(deg_to_rad(90))
		
	
func take_damage(damage):
	health -=damage
	$ProgressBar.show()
	if health <=0:
		Globals.busy_plase.erase(global_position)
		queue_free()


func _on_detaction_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemys"):
		targets.append(body)
	


func _on_detaction_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("enemys"):
		targets.erase(body)
		


func _on_sooting_timer_timeout() -> void:
	get_closest_target()
	if current_target:
		$Turret_tower.play("shoot")
		var bullet = Bullet_scene.instantiate()
		bullet.direction = Vector2.from_angle(get_angle_to(current_target.global_position))
		add_child(bullet)
		
	else:
		$Turret_tower.pause()
	
func get_closest_target():
	var closest_distance: float = INF
	for target in targets:
		if not is_instance_valid(target):
			continue
			
		var distance = global_position.distance_to(target.global_position)
		if distance < closest_distance:
			closest_distance = distance
			current_target = target
	
	return current_target


func _on_timer_timeout() -> void:
	if health == max_health:
		$ProgressBar.hide()


func _on_healing_timer_timeout() -> void:
	if health < max_health:
		health+=1
	else:
		$ProgressBar.hide()
