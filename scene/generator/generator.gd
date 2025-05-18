extends CharacterBody2D

func _on_buildup_area_area_entered(area):
	$Sprite.play("buid_up")
	$AnimationPlayer.play("build_up")
func _on_buildup_area_area_exited(area):
	$Sprite.play_backwards("buid_up")
	$AnimationPlayer.play_backwards("build_up")
