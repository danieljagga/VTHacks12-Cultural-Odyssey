extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var npc_in_range = false
var npc1_in_range = false
var npc2_in_range = false
var fra1_in_range = false
var fra2_in_range = false
var ind1_in_range = false
var ind2_in_range = false
var ind3_in_range = false

@onready var anim = get_node("AnimationPlayer")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction == -1:
		$AnimatedSprite2D.flip_h = true
	elif direction == 1:
		$AnimatedSprite2D.flip_h = false
	
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			anim.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0:
			anim.play("Idle")
	
	if velocity.y > 0:
		anim.play("Fall")

	move_and_slide()
	#npc
	if npc_in_range == true:
		if Input.is_action_just_pressed("ui_focus_next"):
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/Dialogue test.dialogue"), "start")
			return
			
	#npc1
	if npc1_in_range == true:
		if Input.is_action_just_pressed("ui_focus_next"):
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/Dialogue test.dialogue"), "start1")
			return

	#npc2
	if npc2_in_range == true:
		if Input.is_action_just_pressed("ui_focus_next"):
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/Dialogue test.dialogue"), "start2")
			return
	
	if fra1_in_range == true:
		if Input.is_action_just_pressed("ui_focus_next"):
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/France.dialogue"), "fra1")
			
	if fra2_in_range == true:
		if Input.is_action_just_pressed("ui_focus_next"):
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/France.dialogue"), "fra2")
	if ind1_in_range == true:
		if Input.is_action_just_pressed("ui_focus_next"):
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/Indian.dialogue"), "ind1")
	if ind2_in_range == true:
		if Input.is_action_just_pressed("ui_focus_next"):
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/Indian.dialogue"), "ind2")
	if ind3_in_range == true:
		if Input.is_action_just_pressed("ui_focus_next"):
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/Indian.dialogue"), "ind3")
#when nearing npc change value to true




func _on_area_2d_body_entered(body) -> void:
	if body.has_method("NPC"):
		npc_in_range = true
	elif body.has_method("NPC1"):
		npc1_in_range = true
	elif body.has_method("NPC2"):
		npc2_in_range = true
	elif body.has_method("fra1"):
		fra1_in_range = true
	elif body.has_method("fra2"):
		fra2_in_range = true
	elif body.has_method("ind1"):
		ind1_in_range = true
	elif body.has_method("ind2"):
		ind2_in_range = true
	elif body.has_method("ind3"):
		ind3_in_range = true
func _on_area_2d_body_exited(body) -> void:
	if body.has_method("NPC"):
		npc_in_range = false
	elif body.has_method("NPC1"):
		npc1_in_range = false
	elif body.has_method("NPC2"):
		npc2_in_range = false
	elif body.has_method("fra1"):
		fra1_in_range = false
	elif body.has_method("fra2"):
		fra2_in_range = false
	elif body.has_method("ind1"):
		ind1_in_range = false
	elif body.has_method("ind2"):
		ind2_in_range = false
	elif body.has_method("ind3"):
		ind3_in_range = false
