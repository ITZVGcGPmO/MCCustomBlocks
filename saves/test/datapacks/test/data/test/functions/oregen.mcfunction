execute store result score x dummy run data get entity @s Pos[0] 0.0625
scoreboard players set dummy dummy 3
scoreboard players operation x dummy *= dummy dummy
execute store result score z dummy run data get entity @s Pos[2] 0.0625
scoreboard players set dummy dummy 7
scoreboard players operation z dummy *= dummy dummy

execute store result score chunkseed dummy run seed
scoreboard players operation chunkseed dummy += x dummy
scoreboard players operation chunkseed dummy += z dummy
