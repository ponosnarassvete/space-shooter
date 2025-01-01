extends Node

signal rubbish

@export var object_id: int = -1

var out_texts: Array[String]
var in_texts: Array[String]
var rubbished = false

func puzzle_init():
	if !rubbished:
		rubbish.emit()
		rubbished = true
	
	var labels = get_tree().get_nodes_in_group("Out_Text_Label")
	text_to_label(labels, out_texts)
	
	labels = get_tree().get_nodes_in_group("In_Text_Label")
	text_to_label(labels, in_texts)

func text_to_label(labels: Array[Node],text_array: Array[String]):
	for i in labels.size():
		
		if i >= text_array.size():
			return
		
		if text_array[i] != null:
			labels[i].text = text_array[i]
