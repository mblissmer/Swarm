extends KinematicBody2D

var destination = Vector2(0,0)
var speed = 2

func _ready():
	set_process(true)

func _process(delta):
	var pos = get_pos()
	var motion = destination - pos
	pos += motion * delta * speed
	set_pos(pos)
