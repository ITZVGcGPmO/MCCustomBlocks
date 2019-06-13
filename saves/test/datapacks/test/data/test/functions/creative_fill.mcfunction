setblock ~ ~ ~ air
summon minecraft:bat ~ ~ ~ {NoAI:1b}
data modify entity @e[type=minecraft:bat,sort=nearest,limit=1,distance=..0.1] CustomName set from entity @s Item.tag.display.Name
execute positioned ~-1 ~ ~ unless entity @e[distance=..0.1] if block ~ ~ ~ minecraft:purple_shulker_box run function test:creative_fill
execute positioned ~1 ~ ~ unless entity @e[distance=..0.1] if block ~ ~ ~ minecraft:purple_shulker_box run function test:creative_fill
execute positioned ~ ~-1 ~ unless entity @e[distance=..0.1] if block ~ ~ ~ minecraft:purple_shulker_box run function test:creative_fill
execute positioned ~ ~1 ~ unless entity @e[distance=..0.1] if block ~ ~ ~ minecraft:purple_shulker_box run function test:creative_fill
execute positioned ~ ~ ~-1 unless entity @e[distance=..0.1] if block ~ ~ ~ minecraft:purple_shulker_box run function test:creative_fill
execute positioned ~ ~ ~1 unless entity @e[distance=..0.1] if block ~ ~ ~ minecraft:purple_shulker_box run function test:creative_fill
kill @s