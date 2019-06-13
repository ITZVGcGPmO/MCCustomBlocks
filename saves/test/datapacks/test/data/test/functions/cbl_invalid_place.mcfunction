# say invalid spawn!
execute at @p[gamemode=!creative,gamemode=!spectator,scores={bat_spawn=1..},distance=..7] run function test:cbl_summon_spawnitem
execute unless entity @p[gamemode=!spectator,scores={bat_spawn=1..},distance=..7] run function test:cbl_summon_spawnitem
tag @s add seen
tp @s ~ -1000 ~