extends Node

var windowSize
var w
var x
func _ready():
	windowSize = get_viewport().size
	$box.margin_right = 0
	$box.margin_left = 0
	$box.margin_top = 0
	$box.margin_bottom = 0
	$box/vBox/Logo.rect_size = Vector2(windowSize.x, windowSize.x/1.66)
	$box/vBox/Logo.rect_min_size = Vector2(windowSize.x, windowSize.x/(1.66))
	