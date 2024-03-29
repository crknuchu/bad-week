extends CharacterBody3D

#var player = null
@onready var nav_agent = $NavigationAgent3D

const SPEED = 4.0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(false)
	await get_tree().physics_frame
	set_physics_process(true)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if not is_instance_valid(Global.player):
		return
	velocity = Vector3.ZERO
	
	nav_agent.set_target_position(Global.player.global_position)
	var next_nav_point = nav_agent.get_next_path_position()
	velocity = (next_nav_point - global_transform.origin).normalized() * SPEED
	
	print("TEST")
	move_and_slide()
