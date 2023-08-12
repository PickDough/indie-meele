class_name ContainerInject
extends Node

var _binds: Dictionary

func bind(class_nm: String) -> InjectStruct:
	var inj_s = InjectStruct.new()
	inj_s._class_nm = class_nm
	_binds[class_nm] = inj_s	
	
	return inj_s
