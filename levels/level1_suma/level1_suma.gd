extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_door_entered():
	Transition.transition_to("res://levels/level2_bolnica/room.tscn", 0.5, Color.WHITE, Color.WHITE, 3.0)
