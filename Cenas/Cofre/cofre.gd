extends StaticBody2D

var id := 1
var opened = true
enum CorCofre { AMARELO , VERDE, AZUL, VERMELHO }
@export var cor_cofre: CorCofre = CorCofre.AMARELO

@onready var yellow = preload("res://Artwork/Sprites/Tiles/Default/lock_yellow.png")
@onready var green = preload("res://Artwork/Sprites/Tiles/Default/lock_green.png")
@onready var blue = preload("res://Artwork/Sprites/Tiles/Default/lock_blue.png")
@onready var red = preload("res://Artwork/Sprites/Tiles/Default/lock_red.png")

#1 - yellow
#2 - green
#3 - blue
#4 - red

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if cor_cofre == CorCofre.AMARELO:
		$Sprite.texture = yellow
		id = 1
	elif cor_cofre == CorCofre.VERDE:
		$Sprite.texture = blue
		id = 2
	elif cor_cofre == CorCofre.AZUL:
		$Sprite.texture = blue
		id = 3
	elif cor_cofre == CorCofre.VERMELHO:
		$Sprite.texture = red
		id = 4

func open():
	queue_free()
