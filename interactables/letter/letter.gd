extends Node3D

@onready var letter = $Interactible
@onready var letter_content = $"../Player/HUD/letter_content"
@onready var maybe_read = $"../Player/HUD/maybe_read"
@onready var not_sleepy = $"../Player/HUD/not_sleepy"
@onready var shit = $"../Player/HUD/shit"
var read_letter = false

func _ready():
	letter.interacted.connect(on_letter_interacted)
	
func on_letter_interacted():
	Global.player.take_letter()
	letter_content.visible = true
	await get_tree().create_timer(5).timeout
	letter_content.visible = false
	shit.visible = true
	await get_tree().create_timer(3).timeout
	shit.visible = false
	self.queue_free()
