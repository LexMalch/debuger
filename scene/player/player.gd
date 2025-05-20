extends CharacterBody2D
var max_speed = 100
@onready var cave: = $/root/Main/Cave
var damage = 1 

func _physics_process(delta: float) -> void:
	var direction = movement_vector().normalized()
	velocity = max_speed * direction * delta * max_speed
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false	
		$AnimatedSprite2D.play("run_right")
		$RayCast2D.rotation = deg_to_rad(-90)
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true	
		$AnimatedSprite2D.play("run_right")
		$RayCast2D.rotation = deg_to_rad(90)
	elif velocity.y > 0:
		$AnimatedSprite2D.play("run_down")
		$RayCast2D.rotation = deg_to_rad(0)
	elif velocity.y < 0:
		$RayCast2D.rotation = deg_to_rad(180)
		$AnimatedSprite2D.play("run_up")
	else:
		$AnimatedSprite2D.play("idle")
	move_and_slide()
	if Input.is_action_just_pressed("zoom_in"):
		$Camera2D.zoom+= Vector2(0.1,0.1)
		
	if Input.is_action_just_pressed("zoom_out") and $Camera2D.zoom>= Vector2(1.6, 1.6):
		print($Camera2D.zoom)
		$Camera2D.zoom-= Vector2(0.1,0.1)
	if Input.is_action_just_pressed("zoom_reset"):
		$Camera2D.zoom = Vector2(1.75,1.75)
	if Input.is_action_just_pressed("use"):
		if $RayCast2D.get_collider() and $RayCast2D.get_collider().get("name") == "Cave":
			var colider = $RayCast2D.get_collider_rid()
			cave.damage_tile(colider)

		else: return
	if Input.is_action_pressed("rmb"):
		$suck/CollisionShape2D.disabled =false
		$GPUParticles2D.emitting = true
	else:
		$suck/CollisionShape2D.disabled =true
		$GPUParticles2D.emitting = false
func movement_vector():
	var movement_x = Input.get_action_strength("right") - Input.get_action_strength("left")
	var movement_y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return Vector2(movement_x,movement_y) 

	
