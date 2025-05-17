extends CharacterBody2D
var max_speed = 200
func _process(delta):
	var direction = movement_vector().normalized()
	velocity = max_speed * direction
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
	move_and_slide()
	
func movement_vector():
	var movement_x = Input.get_action_strength("right") - Input.get_action_strength("left")
	var movement_y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return Vector2(movement_x,movement_y)
	
