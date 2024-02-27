extends KinematicBody2D

var direction = Vector2()
var speed = 3
var vida = 100
var pontos = 0

#aula4

#	aula 3
var fireBall = preload("res://Scenes/Tiro.tscn")

func _ready():
	pass
func _process(delta):
	if Input.is_key_pressed(KEY_RIGHT):
		direction.x = speed
	elif Input.is_key_pressed(KEY_LEFT):
		direction.x = -speed
	else:
		direction.x = 0

	if Input.is_key_pressed(KEY_UP):
		direction.y = -speed
	elif Input.is_key_pressed(KEY_DOWN):
		direction.y = speed
	else:
		direction.y = 0
		
	if direction.x == 0 and direction.y == 0:
		get_child(0).animation = "Idle"
	else:
		get_child(0).animation = "Walk"
		
	
#	aula 3

	if Input.is_action_just_pressed("Tiro"):
		var newFireball = fireBall.instance()
		newFireball.global_position = position
		get_parent().add_child(newFireball)
	
	
	#Barra de vida
	get_parent().get_child(3).scale.x = vida/100.0
	
	#Barra de pontos
	get_parent().get_child(4).scale.x = pontos / 10.0
	
	#Derrota - Fim de jogo
	if vida <= 0:
		get_tree().change_scene("res://Scenes/Derrota.tscn")
		print('perdi')
	
	#Vitória - Fim de jogo
	if pontos >= 10:
		get_tree().change_scene("res://Scenes/Vitoria.tscn")
	move_and_collide(direction)
	
	#Perder pontos com o tempo
	if pontos > 0:
		pontos -= 0.4 * delta
	
	
	

