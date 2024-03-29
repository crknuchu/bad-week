class_name Interactable
extends Area3D

signal interacted


func on_interact(player: Player):
	interacted.emit()
