tp @s ^ ^ ^0.2
execute unless entity @p[distance=..1] if entity @s[x_rotation=-180..0,y_rotation=0..90] at @e[tag=stair,tag=!raycasted,distance=..1] run setblock ~ ~ ~ minecraft:cobblestone_stairs[shape=inner_left,facing=east,half=bottom]
execute unless entity @p[distance=..1] if entity @s[x_rotation=-180..0,y_rotation=90..180] at @e[tag=stair,tag=!raycasted,distance=..1] run setblock ~ ~ ~ minecraft:cobblestone_stairs[shape=inner_left,facing=south,half=bottom]
execute unless entity @p[distance=..1] if entity @s[x_rotation=-180..0,y_rotation=180..270] at @e[tag=stair,tag=!raycasted,distance=..1] run setblock ~ ~ ~ minecraft:cobblestone_stairs[shape=inner_left,facing=west,half=bottom]
execute unless entity @p[distance=..1] if entity @s[x_rotation=-180..0,y_rotation=270..360] at @e[tag=stair,tag=!raycasted,distance=..1] run setblock ~ ~ ~ minecraft:cobblestone_stairs[shape=inner_left,facing=north,half=bottom]
execute unless entity @p[distance=..1] if entity @s[x_rotation=0..180,y_rotation=0..90] at @e[tag=stair,tag=!raycasted,distance=..1] run setblock ~ ~ ~ minecraft:cobblestone_stairs[shape=inner_left,facing=east,half=top]
execute unless entity @p[distance=..1] if entity @s[x_rotation=0..180,y_rotation=90..180] at @e[tag=stair,tag=!raycasted,distance=..1] run setblock ~ ~ ~ minecraft:cobblestone_stairs[shape=inner_left,facing=south,half=top]
execute unless entity @p[distance=..1] if entity @s[x_rotation=0..180,y_rotation=180..270] at @e[tag=stair,tag=!raycasted,distance=..1] run setblock ~ ~ ~ minecraft:cobblestone_stairs[shape=inner_left,facing=west,half=top]
execute unless entity @p[distance=..1] if entity @s[x_rotation=0..180,y_rotation=270..360] at @e[tag=stair,tag=!raycasted,distance=..1] run setblock ~ ~ ~ minecraft:cobblestone_stairs[shape=inner_left,facing=north,half=top]
execute unless entity @p[distance=..1] as @e[tag=stair,tag=!raycasted,distance=..1] run tag @s add raycasted
execute as @s at @s if entity @p[distance=..6] if entity @e[tag=stair,tag=!raycasted,distance=0..6] run function test:stair_raycast