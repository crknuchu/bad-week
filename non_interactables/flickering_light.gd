extends Node3D

@export var flickering: bool = true
@onready var anim_player: AnimationPlayer = get_node_or_null("AnimationPlayer")


func _ready():
	if not flickering and is_instance_valid(anim_player):
		anim_player.play("RESET")
		anim_player.queue_free()


func turn_on():
	anim_player.play("turn_on")


func turn_off():
	anim_player.play("turn_off")
