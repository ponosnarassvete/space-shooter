extends RichTextLabel

func update_label_text(new_text: String = ""):
	self.text = "[color=yellow]" + new_text + "[/color]"
