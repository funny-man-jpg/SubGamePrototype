extends StaticBody2D

@export var health: int

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.set_text(str(health))

func take_damage(damage: int):
	health -= damage
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.set_text(str(health))
