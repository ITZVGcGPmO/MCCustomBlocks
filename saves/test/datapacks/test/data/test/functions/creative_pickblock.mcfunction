# particle dripping_water ~ ~ ~
clear @s minecraft:purple_shulker_box
tag @s add give_to_player
execute if block ~ ~ ~ minecraft:purple_shulker_box align x align y align z positioned ~.5 ~ ~.5 as @e[tag=customblock,distance=..0.01,sort=nearest,limit=1] at @p[tag=give_to_player] run function test:cbl_summon_spawnitem
tag @s remove give_to_player
execute unless block ~ ~ ~ minecraft:purple_shulker_box positioned ~ ~-1.6 ~ if entity @s[distance=..6] positioned ~ ~1.6 ~ positioned ^ ^ ^.1 run function test:creative_pickblock