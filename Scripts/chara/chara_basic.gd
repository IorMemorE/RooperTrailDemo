extends Card
class_name CharacterBasic
var is_ready := false
## 剧本预设的事件  
## 角色是可以没有事件的  
@export_category("Affair")
@export
var binded_affair :AffairBasic = null
func affair_can_happen() -> bool:
	return binded_affair != null && paranoia >= paranoia_limit
## 不安临界，如果达到这个值，就会发生事件
@export
var paranoia_limit: = 1

@export_category("Token")
## 角色的不安值   
## 一般来说不需要重载获取方式
## 是事件的触发条件  
@export
var paranoia := 0:
	set(v):
		paranoia = v
		if is_ready:
			tokens.paranoia.num = v
## 角色的友好值
## 一般来说不需要重载获取方式
## 是角色友好能力的可执行条件
@export
var goodwill := 0:
	set(v):
		goodwill = v
		if is_ready:
			tokens.goodwill.num = v
## 角色的密谋值
## 一般来说不需要重载获取方式
## 潜移默化地影响一些东西
@export
var intrigue := 0:
	set(v):
		intrigue = v
		if is_ready:
			tokens.intrigue.num = v
## 角色的希望值
## 希望无视不安，视为1个友好
## 绝望不能战胜希望
@export
var hope := 0:
	set(v):
		hope = v
		if is_ready:
			tokens.hope.num = v
## 角色的绝望值
## 绝望无视友好，视为1个不安
## 绝望不能战胜希望
@export
var despair := 0:
	set(v):
		despair = v
		if is_ready:
			tokens.despair.num = v
## 角色的同意
## 代表该角色[曾经]同意过玩家的友好能力请求
@export
var acquainted := 0:
	set(v):
		acquainted = v
		if is_ready:
			tokens.acquainted.num = v
## 角色的拒绝
## 代表该角色[曾经]拒绝过玩家的友好能力请求
@export
var perished := 0:
	set(v):
		perished = v
		if is_ready:
			tokens.perished.num = v
## 角色的死亡
## 代表该角色[曾经]死亡过 
@export	
var dead := 0:
	set(v):
		dead = v
		if is_ready:
			tokens.dead.num = v

@export_category("Chara")
## 角色的名字
@export
var chara_name := &"无名氏"
## 角色的属性词条
@export
var tags:Array[String] = ["None"] 
func _has_attr_tag(tag_name: String) -> bool:
	return tag_name in tags
## 角色的身份
## 身份会为角色提供额外的能力
@export
var role:RoleBasic = RoleBasic.new()

@export
var features:Array[FeatureBasic] = [] as Array[FeatureBasic]

## 角色的能力
@export
var abilities:Array[AbilityBasic] = [] as Array[AbilityBasic]
@export_category("Location")
@export
var init_location : Array[BasicBoard.LocationKind] = [BasicBoard.LocationKind.Faraway] as Array[BasicBoard.LocationKind]
@export
var location := 0
@export
var disable_locations :Array[BasicBoard.LocationKind] = [] as Array[BasicBoard.LocationKind]

@onready
var tokens:CharaTokens = $Tokens

func _ready():
	super._ready()
	is_ready = true

# func _input(event: InputEvent) -> void:
# 	print(event)