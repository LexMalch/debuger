extends CharacterBody2D
var max_speed = 200
@onready var cave: = $/root/Main/Cave
var damage = 1 

func _process(delta):
	var direction = movement_vector().normalized()
	velocity = max_speed * direction * delta
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false	
		$AnimatedSprite2D.play("run_right")
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true	
		$AnimatedSprite2D.play("run_right")
	elif velocity.y > 0:
		
		$AnimatedSprite2D.play("run_down")
	elif velocity.y < 0:
		
		$AnimatedSprite2D.play("run_up")
	else:
		$AnimatedSprite2D.play("idle")
	move_and_collide(velocity)
	if Input.is_action_just_pressed("zoom_in"):
		$Camera2D.zoom+= Vector2(0.1,0.1)
		
	if Input.is_action_just_pressed("zoom_out") and $Camera2D.zoom>= Vector2(0.965, 0.965):
		$Camera2D.zoom-= Vector2(0.1,0.1)
	if Input.is_action_just_pressed("zoom_reset"):
		$Camera2D.zoom = Vector2(1.75,1.75)
	if Input.is_action_just_pressed("use"):
		if move_and_collide(velocity) and move_and_collide(velocity).get_collider().get("name") == "Cave":
			var colider = move_and_collide(velocity).get_collider_rid()
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

	
