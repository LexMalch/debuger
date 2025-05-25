extends Node2D
const max_range = 500
var shoot = false
func _process(delta):
	var mouse_pos = get_local_mouse_position()
	var max_cast_range = mouse_pos.normalized() * max_range
	$Beam.target_position = max_cast_range
	if $Beam.is_colliding():
		$Touch_animation.global_position = $Beam.get_collision_point()
		$Beam_line.set_point_position(1,$Beam_line.to_local($Touch_animation.global_position))
	else:
		$Touch_animation.global_position = $Beam.target_position
		$Beam_line.points[1] = $Touch_animation.global_position
