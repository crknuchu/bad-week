extends StateMachine

var player = null
var timer: float = 0.0

func _ready():
	add_state("idle")
	add_state("follow")
	add_state("attack")
	add_state("dead")
	var parent = get_parent()
	var player = Global.player
	call_deferred("_set_state",states.follow)

func _state_logic(delta):
	print(states.keys()[state])
	if state == states.follow:
		parent.follow()
	if state == states.attack:
		print(timer)
		if timer <= 0:
			parent.attack(parent.damage)
			timer = parent.attack_cooldown
		else:
			timer -= delta
	if state == states.dead:
		parent.die()
	
func _get_transition(delta):
	match state:
		states.idle:
			if parent.should_follow():
				return states.follow
			if parent.is_dead():
				return states.dead
		states.follow:
			if parent.should_attack():
				return states.attack
			if parent.is_dead():
				return states.dead
		states.attack:
			if parent.should_follow():
				return states.follow
			if parent.is_dead():
				return states.dead
		

func _enter_state(new_state, old_state):
	#match new_state:
		#states.idle:
			#parent.animation_player.play("idle")
		#states.follow:
			#parent.animation_player.play("follow")
		#states.attack:
			#parent.animation_player.play("attack")
		#states.dead:
			#parent.animation_player.play("dead")
	pass

func _exit_state(old_state, new_state):
	pass

func _process(delta):
	pass
