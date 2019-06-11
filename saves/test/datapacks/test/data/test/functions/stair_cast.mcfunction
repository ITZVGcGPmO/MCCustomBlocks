summon minecraft:area_effect_cloud ~ ~ ~ {Tags: ["raycast"]}
tp @e[type=minecraft:area_effect_cloud,tag=raycast,sort=nearest,limit=1] ~ ~ ~ ~ ~
execute as @e[type=minecraft:area_effect_cloud,tag=raycast,sort=nearest,limit=1] at @s run function test:stair_raycast