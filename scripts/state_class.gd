class_name state
extends Node

var parent: CharacterBody2D

func init():
	pass

func run(delta):
	pass

func physics(delta):
	pass

func input(event):
	pass

func exit(new_state):
	get_parent().switch_state(new_state)
