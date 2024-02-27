extends KinematicBody2D


var speed = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	look_at(get_global_mouse_position())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var encostei = move_and_collide(Vector2(1,0).rotated(rotation)*speed)
	if encostei:
		if"Inimigo" in encostei.collider.name:
			print("Bati nele")
			encostei.collider.set("vidaInimigo",encostei.collider.vidaInimigo - 10)
			get_parent().remove_child(self)
		if "Mesa" in encostei.collider.name:
			get_parent().remove_child(self)
