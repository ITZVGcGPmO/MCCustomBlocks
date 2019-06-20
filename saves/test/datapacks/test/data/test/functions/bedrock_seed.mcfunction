
execute if block ~ ~ ~ minecraft:bedrock run scoreboard players operation seed dummy += dummy dummy
scoreboard players operation dummy dummy += dummy dummy

execute unless score dummy dummy matches 65536.. positioned ~1 ~ ~ run function test:bedrock_seed