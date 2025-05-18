extends StaticBody2D



func _on_generator_area_body_entered(body: Node2D) -> void:
	print(body)
	if body.is_in_group("player"):
		$Sprite.play("buid_up")
		
		


func _on_generator_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		$Sprite.play_backwards("buid_up")
		
