extends Timer

var enemy = preload("res://Instancias/Inimigo.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TempoInimigo_timeout():
	print("Hora dos inimigo")
	var newEnemy = enemy.instance()
	newEnemy.global_position=Vector2(rand_range(0,1024),rand_range(0,600))
	get_parent().add_child(newEnemy)


