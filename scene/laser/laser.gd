extends Node2D
const max_range = 60
var shoot = false
func _process(delta):
	var mouse_pos = get_local_mouse_position().normalized()
	var max_cast_range = mouse_pos * max_range
	$Beam.target_position = max_cast_range
	if $Beam.get_collider():
		$Touch_animation.global_position = $Beam.get_collision_point()
		$Touch_animation.look_at($Beam.get_collision_point())
		$Beam_line.set_point_position(1,$Beam_line.to_local($Touch_animation.global_position))
	else:
		$Touch_animation.global_position = $Beam.target_position
		$Beam_line.points[1] = $Touch_animation.global_position
	if shoot == true:
		$Beam_line.visible = true
		$Touch_animation.visible = true
	else:
		$Beam_line.visible = false
		$Touch_animation.visible = false
	if Input.is_action_pressed("lmb"):
		shoot = true
	else:
		shoot = false
		
