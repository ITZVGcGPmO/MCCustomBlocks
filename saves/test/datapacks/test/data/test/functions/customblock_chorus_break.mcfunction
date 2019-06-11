# on chorus break (arrow,blockupdate)
say customblock_chorus_break
execute as @a[gamemode=creative,distance=0..6] run summon minecraft:area_effect_cloud ~ ~ ~ {Tags: ["raycast"]}
execute as @a[gamemode=creative,distance=0..6] run tp @e[type=minecraft:area_effect_cloud,tag=raycast,sort=nearest,limit=1] ~ ~ ~ ~ ~
execute as @a[gamemode=creative,distance=0..6] as @e[type=minecraft:area_effect_cloud,tag=raycast,sort=nearest,limit=1] at @s run function test:creative_blockbreak_raycast
kill @e[type=minecraft:item,nbt={Age:0s},distance=..1]
execute unless entity @s[tag=verify_break] run setblock ~ ~ ~ minecraft:chorus_flower
execute if entity @s[tag=verify_break] run loot spawn ~ ~ ~ loot minecraft:gameplay/hero_of_the_village/weaponsmith_gift
execute if entity @s[tag=verify_break] run kill @s