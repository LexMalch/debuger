extends StaticBody2D
var hp = 40


func _on_generator_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player")or body.is_in_group("coins"):
		$Sprite.play("buid_up")
		
		


func _on_generator_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player")  or body.is_in_group("coins"):
		$Sprite.play_backwards("buid_up")



func _on_buildup_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("coins"):
		if body.get("type") == "#":
			Globals.reshetkas+=1
			print("reshetkas= ",Globals.reshetkas)
		else:
			Globals.dollors+=1
			print("dollars= ",Globals.dollors)
		body.explode()
func take_damage(damage):
	hp -=damage
	print(hp)
	if hp <=0:
		Globals.busy_plase.erase(global_position)
		queue_free()	
