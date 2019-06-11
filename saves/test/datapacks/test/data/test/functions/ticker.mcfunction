execute as @e[type=minecraft:fishing_bobber] at @s run function test:test

execute as @e[type=minecraft:tnt_minecart,nbt={TNTFuse:0}] run tag @s add boom
execute as @e[type=minecraft:tnt,nbt={Fuse:1s}] run tag @s add boom

#itemdefs
scoreboard players set @e[type=minecraft:bat,nbt={CustomName:'{"italic":false,"text":"Weird Pumpkin"}'},tag=!seen] mdata 1234567
execute as @e[type=minecraft:bat,nbt={CustomName:'{"italic":false,"text":"Weird Pumpkin"}'},tag=!seen] run tag @s add shulker_box
# spawn custom block
execute at @e[type=minecraft:bat,scores={mdata=1..},tag=!seen] align x align y align z run summon armor_stand ~.5 ~ ~.5 {Tags:["customblock"],Invisible:1b,Invulnerable:1b,NoBasePlate:1b,NoGravity:1b,Small:1b,ArmorItems:[{},{},{},{id:"minecraft:bat_spawn_egg",Count:1b,tag:{CustomModelData:1}}]}
execute as @e[type=minecraft:bat,scores={mdata=1..},tag=!seen] at @s store result entity @e[tag=customblock,sort=nearest,limit=1,distance=..0.5] ArmorItems[3].tag.CustomModelData int 1 run scoreboard players get @s mdata
execute as @e[type=minecraft:bat,scores={mdata=1..},tag=!seen] at @s run data modify entity @e[tag=customblock,sort=nearest,limit=1,distance=..0.5] Tags append from entity @s Tags[]
execute as @e[type=minecraft:bat,scores={mdata=1..},tag=!seen] at @s run data modify entity @e[tag=customblock,sort=nearest,limit=1,distance=..0.5] ArmorItems[3].tag.display.Name set from entity @s CustomName
# item defs
execute at @e[type=minecraft:bat,scores={mdata=1..},tag=!seen,tag=shulker_box] run setblock ~ ~ ~ minecraft:purple_shulker_box destroy
execute as @e[type=minecraft:bat,scores={mdata=1..},tag=!seen] at @s if entity @e[tag=customblock,sort=nearest,limit=1,distance=..0.5] run tp @s ~ -1000 ~
execute as @e[type=minecraft:bat,scores={mdata=1..},tag=!seen] run tag @s add seen

# block destroyed
# destroy shulker box
execute as @e[tag=customblock,tag=shulker_box] store success score @s mdata at @s unless block ~ ~ ~ minecraft:purple_shulker_box run data modify entity @e[type=item,sort=nearest,limit=1,distance=0..6,nbt={Age:0s,Item:{id:"minecraft:purple_shulker_box"}}] Item set from entity @s ArmorItems[3]
execute as @e[tag=customblock,tag=shulker_box,scores={mdata=0}] store success score @s mdata at @s unless block ~ ~ ~ minecraft:purple_shulker_box run data modify entity @e[type=item,sort=nearest,limit=1,distance=0..6,nbt={Age:1s,Item:{id:"minecraft:purple_shulker_box"}}] Item set from entity @s ArmorItems[3]

execute as @e[tag=customblock,tag=shulker_box] at @s unless block ~ ~ ~ minecraft:purple_shulker_box run kill @s

# block accessed
# access beacon, raycast and run commands
execute as @a[scores={touch_beacon=1..}] at @s positioned ~ ~1.62 ~ run function test:raycast_to_customblock
scoreboard players reset @a touch_beacon
execute as @a[scores={open_sh_bx=1..}] at @s positioned ~ ~1.62 ~ run function test:raycast_to_customblock
scoreboard players reset @a open_sh_bx

scoreboard players operation @e[tag=spinning] spinmerightround += spin spinmerightround
scoreboard players operation @e[tag=spinning] spinmerightround %= degrees spinmerightround
execute as @e[tag=spinning] store result entity @s Rotation[0] float 0.01 run scoreboard players get @s spinmerightround

# purple shulker box itemdrop handling
execute as @e[nbt={Item:{id:"minecraft:purple_shulker_box"}}] if data entity @s Item.tag.CustomModelData run kill @s
execute as @e[nbt={Item:{id:"minecraft:purple_shulker_box"}}] unless data entity @s Item.tag.CustomModelData run data merge entity @s {Item:{id:"minecraft:shulker_box"}}

# increase ambient sound ticker after killing off "spawner" mites
scoreboard players set @e[type=minecraft:bat,tag=!seen] mdata -1
execute as @e[type=minecraft:bat,tag=!seen] run tag @s add seen
scoreboard players set @e[type=minecraft:bat,tag=seen,scores={mdata=..-120}] mdata -1
execute at @a at @e[distance=..16,type=minecraft:bat,tag=seen,scores={mdata=-1}] run playsound minecraft:entity.bat.ambient.replacement neutral @a ~ ~ ~ 0.1
scoreboard players remove @e[type=minecraft:bat,tag=seen] mdata 1
execute at @a run scoreboard players remove @e[distance=..16,limit=1,sort=random,type=minecraft:bat,tag=seen] mdata 1