# wrap scoreboard values around entity's model count
function test:item_def/cbl_data_lookup
execute store result score # mdata run data get entity @s ArmorItems[3].tag.ModelCount
scoreboard players add # mdata 1
scoreboard players operation @s mdata %= # mdata
# set CustomModelData to the offset from base model
execute store result score # mdata run data get entity @s ArmorItems[3].tag.BaseModelData
scoreboard players operation @s mdata += # mdata
execute store result entity @s ArmorItems[3].tag.CustomModelData int 1 run scoreboard players get @s mdata
scoreboard players operation @s cbl_load = # cbl_load