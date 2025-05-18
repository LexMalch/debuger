extends RigidBody2D
var type
@export var gold : Color
@export var silver : Color
func _ready() -> void:
	if type == "$":
		$Polygon2D.color = gold
	elif type == "#":
		$Polygon2D.color = silver
	
		
