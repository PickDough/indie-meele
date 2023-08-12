extends Node

@onready var injector: SceneInjector = $Injector
var container: ContainerInject = ContainerInject.new()

func _enter_tree():
	get_parent().child_entered_tree.connect(_on_sibling_entered)
	get_parent().ready.connect(func() : _inject_node(get_parent()))
	injector.bind(container)
	

func _on_sibling_entered(sibling: Node):
	if container._binds.has(sibling.get_class()):
		container._binds[sibling.get_class()].from(sibling)


func _inject_node(nd: Node):
	for i in range(1, nd.get_child_count()):
		var child = nd.get_child(i)
