extends StaticBody2D
var player_inside  = false	
var zalupa_opend = false
var building_sprite= preload("res://scene/feeler/sprite/feeler.png")
var price = 0
var hp = 10
@onready var cave: = $/root/Main/Cave

func _ready() -> void:
	cave.feeler_placed(global_position)

func  _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_inside  == true and zalupa_opend == false:
		zalupa_opend = true
		$Sprite.play("interact")


func _on_feeler_area_body_entered(body: Node2D) -> void:
	player_inside  = true	




func _on_feeler_area_body_exited(body: Node2D) -> void:
	player_inside  = false
	if	zalupa_opend == true:
		$Sprite.play_backwards("interact")

	zalupa_opend = false
func take_damage(damage):
	hp -=damage
	print(hp)
	if hp <=0:
		Globals.busy_plase.erase(global_position)
		queue_free()
