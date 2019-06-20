summon minecraft:item ~ ~ ~ {Item:{"id":"minecraft:bat_spawn_egg",Count:1b},Tags:["item_giveback"]}
data modify entity @e[tag=item_giveback,sort=nearest,limit=1,distance=..0.01] Item set from entity @s ArmorItems[3]
data modify entity @e[tag=item_giveback,sort=nearest,limit=1,distance=..0.01] Item.tag.RepairCost set value -999
data modify entity @e[tag=item_giveback,sort=nearest,limit=1,distance=..0.01] Item.tag.CustomModelData set from entity @s ArmorItems[3].tag.BaseModelData
data remove entity @e[tag=item_giveback,sort=nearest,limit=1,distance=..0.01] Item.tag.ModelCount
data remove entity @e[tag=item_giveback,sort=nearest,limit=1,distance=..0.01] Item.tag.BaseModelData
tag @e[tag=item_giveback,sort=nearest,limit=1] remove item_giveback