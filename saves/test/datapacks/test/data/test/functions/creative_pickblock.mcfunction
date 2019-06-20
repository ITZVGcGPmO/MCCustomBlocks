# particle dripping_water ~ ~ ~

replaceitem entity @s weapon.mainhand minecraft:air
execute if block ~ ~ ~ minecraft:purple_shulker_box align x align y align z positioned ~.5 ~ ~.5 if entity @e[tag=customblock,distance=..0.01,sort=nearest,limit=1] run tag @s add give_to_player
execute if block ~ ~ ~ minecraft:purple_shulker_box align x align y align z positioned ~.5 ~ ~.5 as @e[tag=customblock,distance=..0.01,sort=nearest,limit=1] at @p[tag=give_to_player] run function test:cbl_summon_spawnitem
execute if entity @s[tag=give_to_player] store result score @s dummy run data get entity @s SelectedItemSlot
execute if entity @s[tag=give_to_player] run function test:specify_slot
tag @s remove give_to_player
execute unless block ~ ~ ~ minecraft:purple_shulker_box positioned ~ ~-1.6 ~ if entity @s[distance=..6] positioned ~ ~1.6 ~ positioned ^ ^ ^.1 run function test:creative_pickblock

