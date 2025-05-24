extends CharacterBody2D
const  max_speed = 50
var damage = 10
var attacking_target
@export var player: Node2D
@onready var nav_ag : = $NavigationAgent2D as NavigationAgent2D
@onready var targets = [%Player,%Generator]
@onready var nearest_body = %Player

func _physics_process(delta: float) -> void:
	var direction = to_local(nav_ag.get_next_path_position()).normalized()
	velocity = direction * max_speed
	move_and_slide()

func makepath() -> void:
	nav_ag.target_position = nearest_body.global_position
	$Spider_body.look_at(nearest_body.global_position)
	$Spider_legs.look_at(nearest_body.global_position)
	$Spider_head.look_at(nearest_body.global_position)
func _on_timer_timeout():
	update_nearest_body()
	makepath()


func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("ally"):
		targets.append(body)
		update_nearest_body()


func _on_detection_area_body_exited(body: Node2D) -> void:
	targets.erase(body)
	update_nearest_body()
	
func update_nearest_body():
	if targets.is_empty():
		nearest_body = null
		return
	

	nearest_body = targets[0]
	var nearest_distance = global_position.distance_to(nearest_body.global_position)
	
	for body in targets:
		if body:
			var dist = global_position.distance_to(body.global_position)
			if dist < nearest_distance:
				nearest_distance = dist
				nearest_body = body


func _on_spider_head_area_entered(area: Area2D) -> void:
	if area.is_in_group("ally"):
		$Attack_Timer.start()
		attacking_target = area
	


func _on_spider_head_area_exited(area: Area2D) -> void:
	$Attack_Timer.stop()


func _on_attack_timer_timeout() -> void:
	attacking_target.take_damage(damage)
	


func _on_spider_head_body_entered(body: Node2D) -> void:
	if body.is_in_group("ally"):
		$Attack_Timer.start()
		attacking_target = body


func _on_spider_head_body_exited(body: Node2D) -> void:
	$Attack_Timer.stop()
	
	
