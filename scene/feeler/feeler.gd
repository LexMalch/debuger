extends CharacterBody2D


func _on_feeler_area_area_entered(area):
	if Input.is_action_pressed("interact"):
		$Sprite.play("interact")
		
	
