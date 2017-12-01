extends Node2D

var player
var balls = []
var ballScene

func _ready():
	ballScene = preload("res://ball.tscn")
	player = get_node("Player")
	set_process(true)
	set_process_input(true)

func _input(ev):
	if (ev.type==InputEvent.MOUSE_MOTION):
		player.set_pos(get_viewport().get_mouse_pos())
	if (ev.is_action_pressed("mouseLeft")):
		makeBall()
		
func _process(delta):
	if balls.size() > 0:
		for ball in balls:
			ball.destination = player.get_pos()

func makeBall():
	var spawnPoint = Vector2(rand_range(100,400),rand_range(100,400))
	var newball = ballScene.instance()
	add_child(newball)
	newball.set_pos(spawnPoint)
	balls.append(newball)