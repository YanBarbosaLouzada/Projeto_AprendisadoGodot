extends KinematicBody2D

var player
var Angle 
var Speed = 3
var vidaInimigo = 30


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().get_child(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Angle = get_angle_to(player.position)
	
	if position.distance_to(player.position) > 75:
		move_and_collide(Vector2(1, 0).rotated(Angle) * Speed)
	else:
		player.vida -= 10
		get_parent().remove_child(self)
	
	if vidaInimigo <= 0:
		player.pontos += 1
		get_parent().remove_child(self)
	
	
	
