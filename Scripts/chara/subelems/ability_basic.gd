extends Resource
class_name  AbilityBasic
@export
var goodwill_need : = 0
@export
var is_loop_once := false
var has_used := false
@export
var description := "无描述"
## 脚本修改
var owner:CharacterBasic = null
var _respone_result := false
signal request_use(chara:CharacterBasic)
signal respone_use(result:bool)
func __write_result(result:bool):
    _respone_result = result
func _init() -> void:
    respone_use.connect(__write_result)
## 注意，这里的can_use是一个异步函数
## 因为需要等待剧作家的回应
## 尽管有些事件是不需要回应的
func can_use() -> bool:
    if !owner:
        return false		
    if owner.goodwill < goodwill_need:
        return false
    emit_signal("request_use", owner)
    await respone_use
    return _respone_result

func execute():
    print("AbilityBasic")
