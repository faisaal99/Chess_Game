extends CanvasLayer

var sizeOfSquare: int
var isWhite = true
const white = Color.white
const black = Color.black

onready var boardAnchor = $BoardAnchor as Control

var beginCenter = false

func _ready():
	sizeOfSquare = get_viewport().size.y / 8
	_generateBoard()

func _process(delta):
	if beginCenter:
		_positionInTheMiddle()

# Calculate the the size of every square to perfectly fit 
# the screen and generate a board
func _generateBoard():
	var squares = []
	
	# For every row and column, add a square with the correct position and color
	for column in range(8):
		for row in range(8):
			var newSQ = ColorRect.new()
			newSQ.rect_size = Vector2(sizeOfSquare, sizeOfSquare)
			newSQ.rect_position.x = row * sizeOfSquare
			newSQ.rect_position.y = column * sizeOfSquare
			
			if isWhite: 
				newSQ.color = white
			else:
				newSQ.color = black
			isWhite = !isWhite
			
			squares.append(newSQ)
		
		# To create a checkered pattern
		isWhite = !isWhite
	
	for sq in squares:
		boardAnchor.add_child(sq)
	
	beginCenter = true

# Calculate the distance the anchor has to move to position the board in the middle
func _positionInTheMiddle():
	var offsetFromLeft = get_viewport().size.x / 2 - sizeOfSquare * 4
	var offsetFromTop = get_viewport().size.y / 2 - sizeOfSquare * 4
	
	boardAnchor.set_position(Vector2(offsetFromLeft, offsetFromTop))







