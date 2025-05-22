extends CharacterBody2D
const  max_speed = 50
@export var player: Node2D
@onready var nav_ag : = $NavigationAgent2D as NavigationAgent2D
func _ready():
	makepath()
func _physics_process(delta: float) -> void:
	var direction = to_local(nav_ag.get_next_path_position()).normalized()
	velocity = direction * max_speed
	move_and_slide()
	$Spider_body.look_at(player.global_position)
	$Spider_legs.look_at(player.global_position)
	$Spider_head.look_at(player.global_position)
func makepath() -> void:
	nav_ag.target_position = player.global_position
func _on_timer_timeout():
	makepath()
