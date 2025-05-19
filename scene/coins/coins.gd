extends RigidBody2D
var type
@export var gold : Color
@export var silver : Color
func _ready() -> void:
	if type == "$":
		$Polygon2D.color = gold
	elif type == "#":
		$Polygon2D.color = silver
func explode():
	$CollisionShape2D.set_deferred("disabled","true")
	$GPUParticles2D.emitting = true
	$Polygon2D.hide()
	$Timer.start()
		


func _on_timer_timeout() -> void:
	queue_free()
