extends Node2D



func _on_Botaosair_pressed():
	get_tree().quit()


func _on_Botaojogar_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")
