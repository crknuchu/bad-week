class_name Player
extends CharacterBody3D

@export var sensitivity: float = 0.6
@export var max_health: float = 100
var has_key: bool = false
var has_pills: bool = false
@export var has_shovel: bool = false:
	set(value):
		shovel.visible = value
		has_shovel = value
	get:
		return has_shovel

@export var movement_speed = 5.0
const JUMP_VELOCITY = 6.5
var gravity = 30.0

@onready var camera: Camera3D = $Camera3D
@onready var interact_raycast: RayCast3D = $Camera3D/InteractRaycast
@onready var hud: CanvasLayer = $HUD
@onready var interact_label: Label = $HUD/InteractLabel
@onready var attack_hitbox: Area3D = $AttackHitbox
@onready var blood_hp_indicator: ColorRect = $HUD/Blood
@onready var health: float = max_health
@onready var blood_particle = $BloodParticle
@onready var shovel_animationplayer = $Camera3D/Shovel/AnimationPlayer
@onready var shovel: Node3D = $Camera3D/Shovel

func _ready():
	shovel.visible = has_shovel
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	Global.player = self
	_update_blood_hp_indicator()


func _physics_process(delta):
	_process_movement(delta)
	_process_input()


func _process(delta):
	_process_interacting()


func _process_interacting():
	interact_label.visible = interact_raycast.is_colliding()
	if Input.is_action_just_pressed("interact") and interact_raycast.is_colliding():
		interact()


func _process_input():
	if Input.is_action_just_pressed("attack"):
		if not shovel_animationplayer.is_playing():
			attack()


func attack():
	if has_shovel:
		shovel_animationplayer.play("attack")


func deal_damage():
	for body in attack_hitbox.get_overlapping_bodies():
		#print(body)
		body.hit()
		blood_particle.emitting = true


func _process_movement(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	var input_dir = Input.get_vector(
		"move_left", "move_right", "move_forward", "move_backward"
		)
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	velocity.x = direction.x * movement_speed
	velocity.z = direction.z * movement_speed

	move_and_slide()
	
	if position.y < -20.0:
		death()


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		camera.rotate_x(-sensitivity*event.relative.y/100.0)
		camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, -90, 90)
		rotate_y(-sensitivity*event.relative.x/100.0)


func interact():
	var interactable: Interactable = interact_raycast.get_collider()
	interactable.on_interact(self)


func hit(damage: float):
	health -= damage
	_update_blood_hp_indicator()
	if health <= 0:
		death()


func heal(amount: float):
	health += amount


func death():
	print("umr8")


func _update_blood_hp_indicator():
	blood_hp_indicator.material.set("shader_parameter/strength",1.0-health/max_health)
	

func pick_up_key():
	has_key = true
	
	
func take_pills():
	has_pills = true
