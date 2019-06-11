tp @s ^ ^ ^0.1
execute unless entity @p[gamemode=creative,distance=..1] as @e[tag=customblock,tag=!verify_break,distance=..0.5] run tag @s add verify_break
execute as @s at @s if entity @p[gamemode=creative,distance=..6] if entity @e[tag=customblock,tag=!verify_break,distance=0..6] run function test:creative_blockbreak_raycast