extends Area2D

var id := 1
enum CorChave { AMARELO , VERDE, AZUL, VERMELHO }
@export var cor_chave: CorChave = CorChave.AMARELO

@onready var yellow = preload("res://Artwork/Sprites/Tiles/Default/key_yellow.png")
@onready var green = preload("res://Artwork/Sprites/Tiles/Default/key_green.png")
@onready var blue = preload("res://Artwork/Sprites/Tiles/Default/key_blue.png")
@onready var red = preload("res://Artwork/Sprites/Tiles/Default/key_red.png")

#1 - yellow
#2 - green
#3 - blue
#4 - red

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if cor_chave == CorChave.AMARELO:
		$Sprite.texture = yellow
		id = 1
	elif cor_chave == CorChave.VERDE:
		$Sprite.texture = blue
		id = 2
	elif cor_chave == CorChave.AZUL:
		$Sprite.texture = blue
		id = 3
	elif cor_chave == CorChave.VERMELHO:
		$Sprite.texture = red
		id = 4


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Jogador"):
		var cofres = get_tree().get_nodes_in_group("Cofre")
		print(cofres)
		for i in cofres:
			if i.id == id:
				i.open()
		queue_free()
		
