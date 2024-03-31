extends AudioStreamPlayer

var walk_sound = preload("res://sounds/going-on-a-forest-road-gravel-and-grass-6404.mp3")
var nature_sound = preload("res://sounds/evening-birds-singing-in-spring-background-sounds-of-nature-146388.mp3")


func play_walk_sound():
	self.stream = walk_sound
	play()

func play_nature_sound():
	self.stream = nature_sound
	play()
