extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_swing():
	$Enemy.take_damage(50)
