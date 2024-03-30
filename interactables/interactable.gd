class_name Interactable
extends PhysicsBody3D

signal interacted


func on_interact(player: Player):
	interacted.emit()
