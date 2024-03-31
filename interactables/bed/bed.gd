extends Node3D

@onready var bed = $Interactable
@onready var room = $"../../"
@onready var main_menu = room.get_parent()
@onready var maybe_read = $"../../Player/HUD/maybe_read"
@onready var not_sleepy = $"../../Player/HUD/not_sleepy"

func _ready():
	bed.interacted.connect(on_bed_interacted)
	
func on_bed_interacted():
	if(not Global.player.has_letter):
		maybe_read.visible = true
		await get_tree().create_timer(3).timeout
		maybe_read.visible = false
		
	if (Global.player.has_letter):
		if(not Global.player.has_pills):
			not_sleepy.visible = true
			await get_tree().create_timer(3).timeout
			not_sleepy.visible = false
		else:
			print("load next level")
