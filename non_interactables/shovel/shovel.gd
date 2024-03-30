extends Node3D


signal attacked

func _ready():
	await get_tree().process_frame
	attacked.connect(Global.player.deal_damage)
