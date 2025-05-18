extends CharacterBody2D
func _on_buildup_area_area_entered(area):
	$Srpite.play("buid_up")
	$AnimationPlayer.play("build_up")
func _on_buildup_area_area_exited(area):
	$Srpite.play_backwards("buid_up")
	$AnimationPlayer.play_backwards("build_up")
