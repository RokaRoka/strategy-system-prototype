extends AnimatedSprite

const ANIM_STAND_STRING = "stand"
const ANIM_WALK_STRING = "walk"
const ANIM_MINE_STRING = "mine"


func _ready():
	play( ANIM_STAND_STRING )
	pass

func _on_Unit_anim_stand():
	play( ANIM_STAND_STRING )


func _on_Unit_anim_walk():
	play( ANIM_WALK_STRING )


func _on_Unit_anim_mine():
	play( ANIM_MINE_STRING )
