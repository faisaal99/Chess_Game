extends Sprite

class_name Piece

onready var squareSize = get_viewport().size.y / 8
onready var firstSQPos: Vector2

const imgSize = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	_fixScale()

func _process(delta):
	_calcFirstSQPos(1, 1)
	self.position = firstSQPos
	

# Calculate the Vector2 to position the piece on the 1,1 square
# ***
# The parameters lets you pick a column and row, should you want the piece
# to be there
func _calcFirstSQPos(column: int, row: int):
	column = clamp(column, 1, 8)
	
	var xPos = get_viewport().size.x / 2 - squareSize * 4 + ((column - 1) * squareSize)
	var yPos = get_viewport().size.y / 2 - squareSize * 4 + ((row - 1) * squareSize)
	firstSQPos = Vector2(xPos, yPos)

# Scale down the Sprite just enough so it fits inside the square
func _fixScale():
	self.scale = Vector2(squareSize / imgSize, squareSize / imgSize)
