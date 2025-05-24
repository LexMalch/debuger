extends StaticBody2D
var building_sprite= preload("res://scene/turret/sprite/turret.png")
var price = 3
var hp = 10
func take_damage(damage):
	hp -=damage
	print(hp)
	if hp <=0:
		queue_free()
