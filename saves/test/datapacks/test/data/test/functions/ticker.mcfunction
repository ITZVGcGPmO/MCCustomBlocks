clear @a minecraft:enchanted_book{CustomModelData:1,display:{Name:'{"text":""}'}}
execute as @e[type=minecraft:fishing_bobber] at @s run function test:test

execute as @e[type=minecraft:tnt_minecart,nbt={TNTFuse:0}] run tag @s add boom
execute as @e[type=minecraft:tnt,nbt={Fuse:1s}] run tag @s add boom

execute as @e[type=minecraft:bat,tag=!seen] run function test:item_def/tag_spawn_bat
# pre spawnblock check
execute as @e[type=minecraft:bat,tag=cbl_spawn,tag=!seen] at @s unless block ~ ~ ~ #test:player_pl_replace at @p[scores={bat_spawn=1..},distance=..7] if entity @p[distance=..0.01,x_rotation=-40..40,y_rotation=-45..45] at @s run tp @s ~ ~ ~-1
execute as @e[type=minecraft:bat,tag=cbl_spawn,tag=!seen] at @s unless block ~ ~ ~ #test:player_pl_replace at @p[scores={bat_spawn=1..},distance=..7] if entity @p[distance=..0.01,x_rotation=-40..40,y_rotation=45..135] at @s run tp @s ~1 ~ ~
execute as @e[type=minecraft:bat,tag=cbl_spawn,tag=!seen] at @s unless block ~ ~ ~ #test:player_pl_replace at @p[scores={bat_spawn=1..},distance=..7] if entity @p[distance=..0.01,x_rotation=-40..40,y_rotation=135..225] at @s run tp @s ~ ~ ~1
execute as @e[type=minecraft:bat,tag=cbl_spawn,tag=!seen] at @s unless block ~ ~ ~ #test:player_pl_replace at @p[scores={bat_spawn=1..},distance=..7] if entity @p[distance=..0.01,x_rotation=-40..40,y_rotation=225..315] at @s run tp @s ~-1 ~ ~
execute as @e[type=minecraft:bat,tag=cbl_spawn,tag=!seen] at @s unless block ~ ~ ~ #test:player_pl_replace at @p[scores={bat_spawn=1..},distance=..7] if entity @p[distance=..0.01,x_rotation=-90..-40] at @s run tp @s ~ ~-1 ~
execute as @e[type=minecraft:bat,tag=cbl_spawn,tag=!seen] at @s unless block ~ ~ ~ #test:player_pl_replace at @p[scores={bat_spawn=1..},distance=..7] if entity @p[distance=..0.01,x_rotation=40..90] at @s run tp @s ~ ~1 ~
execute as @e[type=minecraft:bat,tag=cbl_spawn,tag=!seen] at @s if block ~ ~ ~ minecraft:snow unless block ~ ~ ~ minecraft:snow[layers=1] run tp @s ~ ~1 ~
execute as @e[type=minecraft:bat,tag=cbl_spawn,tag=!seen] at @s unless block ~ ~ ~ #test:player_pl_replace run function test:cbl_invalid_place

execute at @e[type=minecraft:bat,tag=cbl_spawn,tag=!seen] as @e[type=!#test:plblk_over,distance=..0.8] run scoreboard players add @e[distance=..0.01,type=minecraft:bat,tag=cbl_spawn,tag=!seen] dummy 1
execute at @e[type=minecraft:bat,tag=cbl_spawn,tag=!seen] positioned ~ ~-.5 ~ as @e[type=#test:1_5_tall,type=!#test:plblk_over,distance=..0.8] positioned ~ ~.5 ~ run scoreboard players add @e[distance=..0.01,type=minecraft:bat,tag=cbl_spawn,tag=!seen] dummy 1
execute at @e[type=minecraft:bat,tag=cbl_spawn,tag=!seen] positioned ~ ~-1 ~ as @e[type=#test:2_tall,type=!#test:plblk_over,distance=..0.8] positioned ~ ~1 ~ run scoreboard players add @e[distance=..0.01,type=minecraft:bat,tag=cbl_spawn,tag=!seen] dummy 1
execute at @e[type=minecraft:bat,tag=cbl_spawn,tag=!seen] positioned ~ ~-2 ~ as @e[type=#test:3_tall,type=!#test:plblk_over,distance=..0.8] positioned ~ ~2 ~ run scoreboard players add @e[distance=..0.01,type=minecraft:bat,tag=cbl_spawn,tag=!seen] dummy 1
execute as @e[type=minecraft:bat,tag=cbl_spawn,scores={dummy=2..},tag=!seen] at @s run function test:cbl_invalid_place
# spawn custom block
execute at @e[type=minecraft:bat,tag=cbl_spawn,tag=!seen] align x align y align z run summon armor_stand ~.5 ~ ~.5 {Tags:["customblock"],Invisible:1b,Invulnerable:1b,NoBasePlate:1b,NoGravity:1b,Small:1b,ArmorItems:[{},{},{},{id:"minecraft:bat_spawn_egg",Count:1b,tag:{CustomModelData:1}}]}
execute as @e[type=minecraft:bat,tag=cbl_spawn,tag=!seen] at @s run data modify entity @e[tag=customblock,sort=nearest,limit=1,distance=..0.5] Tags append from entity @s Tags[]
execute as @e[type=minecraft:bat,tag=cbl_spawn,tag=!seen] at @s run tag @e[tag=customblock,sort=nearest,limit=1,distance=..0.5] remove cbl_spawn
execute as @e[type=minecraft:bat,tag=cbl_spawn,tag=!seen] at @s run data modify entity @e[tag=customblock,sort=nearest,limit=1,distance=..0.5] CustomName set from entity @s CustomName
execute as @e[type=minecraft:bat,tag=cbl_spawn,tag=!seen] at @s run data modify entity @e[tag=customblock,sort=nearest,limit=1,distance=..0.5] ArmorItems[3].tag.display.Name set from entity @s CustomName
execute as @e[tag=customblock] unless score @s cbl_load = # cbl_load run function test:cbl_reload_texture

# item defs
execute at @e[type=minecraft:bat,tag=cbl_spawn,tag=!seen,tag=shulker_box] run setblock ~ ~ ~ minecraft:purple_shulker_box destroy
execute as @e[type=minecraft:bat,tag=cbl_spawn,tag=!seen] at @s run data modify block ~ ~ ~ CustomName set from entity @s CustomName
execute as @e[type=minecraft:bat,tag=cbl_spawn,tag=!seen] at @s if entity @e[tag=customblock,sort=nearest,limit=1,distance=..0.5] run tp @s ~ -1000 ~
execute as @e[type=minecraft:bat,tag=cbl_spawn,tag=!seen] run tag @s add seen

# block destroyed
# destroy shulker box
execute as @e[tag=customblock,tag=shulker_box] at @s unless block ~ ~ ~ minecraft:purple_shulker_box run data modify entity @s ArmorItems[3].tag.CustomModelData set from entity @s ArmorItems[3].tag.BaseModelData
execute as @e[tag=customblock,tag=shulker_box] at @s unless block ~ ~ ~ minecraft:purple_shulker_box run data remove entity @s ArmorItems[3].tag.BaseModelData
execute as @e[tag=customblock,tag=shulker_box] at @s unless block ~ ~ ~ minecraft:purple_shulker_box run data remove entity @s ArmorItems[3].tag.ModelCount

execute as @e[tag=customblock,tag=shulker_box] at @s unless block ~ ~ ~ minecraft:purple_shulker_box run data modify entity @e[type=item,sort=nearest,limit=1,distance=0..6,nbt={Age:0s,Item:{id:"minecraft:purple_shulker_box"}}] Item set from entity @s ArmorItems[3]
execute as @e[tag=customblock,tag=shulker_box] at @s unless block ~ ~ ~ minecraft:purple_shulker_box run data modify entity @e[type=item,sort=nearest,limit=1,distance=0..6,nbt={Age:1s,Item:{id:"minecraft:purple_shulker_box"}}] Item set from entity @s ArmorItems[3]
execute as @e[tag=customblock,tag=shulker_box] at @s unless block ~ ~ ~ minecraft:purple_shulker_box run kill @s

# block accessed
# access beacon, raycast and run commands
execute as @a[scores={touch_beacon=1..}] at @s positioned ~ ~1.62 ~ run function test:raycast_to_customblock
scoreboard players reset @a touch_beacon
execute as @a[scores={open_sh_bx=1..}] at @s positioned ~ ~1.62 ~ run function test:raycast_to_customblock

scoreboard players operation @e[tag=spinning] spinmerightround += spin spinmerightround
scoreboard players operation @e[tag=spinning] spinmerightround %= degrees spinmerightround
execute as @e[tag=spinning] store result entity @s Rotation[0] float 0.01 run scoreboard players get @s spinmerightround

# purple shulker box and other itemdrop handling
execute as @e[nbt={Item:{id:"minecraft:purple_shulker_box"}}] if data entity @s Item.tag.CustomModelData run kill @s
execute as @e[nbt={Item:{id:"minecraft:purple_shulker_box"}}] unless data entity @s Item.tag.CustomModelData run data merge entity @s {Item:{id:"minecraft:shulker_box"}}
execute as @e[type=item,nbt={Item:{id:"minecraft:bat_spawn_egg"}}] if data entity @s Item.tag.CustomModelData unless data entity @s Item.Tag.RepairCost run data merge entity @s {Item:{tag:{RepairCost:-999}}}

# increase ambient sound ticker after killing off "spawner" mites
scoreboard players set @e[type=minecraft:bat,tag=!seen] mdata -1
execute as @e[type=minecraft:bat,tag=!seen] run tag @s add seen
scoreboard players set @e[type=minecraft:bat,tag=seen,scores={mdata=..-120}] mdata -1
execute at @a as @e[distance=..16,type=minecraft:bat,tag=seen,scores={mdata=-1}] unless entity @s[nbt={Silent:1b}] at @s run playsound minecraft:entity.bat.ambient.replaced neutral @a ~ ~ ~ 0.1
scoreboard players remove @e[type=minecraft:bat,tag=seen] mdata 1
execute at @a run scoreboard players remove @e[distance=..16,limit=1,sort=random,type=minecraft:bat,tag=seen] mdata 1

scoreboard players reset @a bat_spawn
scoreboard players reset @a open_sh_bx

execute as @e[tag=wait4shlk,nbt={PortalCooldown:0}] at @s positioned ~ ~.5 ~ unless block ^ ^ ^1.1 #test:shulker_box run kill @s
execute as @e[tag=wait4shlk,nbt={PortalCooldown:0,Rotation:[0.01f]}] at @s positioned ~ ~.5 ~ positioned ^ ^ ^.62 if block ~ ~ ~ #test:shulker_box align x align y align z positioned ~.5 ~ ~.5 run function test:shlk_close
execute as @e[tag=wait4shlk,nbt={PortalCooldown:0,Rotation:[0.001f]}] at @s positioned ~ ~.48 ~ positioned ^ ^ ^.96 if block ~ ~ ~ #test:shulker_box align x align y align z positioned ~.5 ~ ~.5 run function test:shlk_close

execute as @e[tag=wait4shlk,nbt=!{PortalCooldown:0}] run data merge entity @s {Motion:[0.0d,0.0d,0.0d]}
execute as @e[tag=wait4shlk,nbt={PortalCooldown:0,Rotation:[0.0f,0.01f]}] run data merge entity @s {Motion:[0.0d,0.0d,1.0d]}
execute as @e[tag=wait4shlk,nbt={PortalCooldown:0,Rotation:[90.0f,0.01f]}] run data merge entity @s {Motion:[-1.0d,0.0d,0.0d]}
execute as @e[tag=wait4shlk,nbt={PortalCooldown:0,Rotation:[180.0f,0.01f]}] run data merge entity @s {Motion:[0.0d,0.0d,-1.0d]}
execute as @e[tag=wait4shlk,nbt={PortalCooldown:0,Rotation:[270.0f,0.01f]}] run data merge entity @s {Motion:[1.0d,0.0d,0.0d]}
execute as @e[tag=wait4shlk,nbt={PortalCooldown:0,Rotation:[0.001f,90.01f]}] run data merge entity @s {Motion:[0.0d,-1.0d,0.0d]}
execute as @e[tag=wait4shlk,nbt={PortalCooldown:0,Rotation:[0.001f,-90.01f]}] run data merge entity @s {Motion:[0.0d,1.0d,0.0d]}

execute at @a[gamemode=creative] as @e[distance=..8,type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:bat_spawn_egg"}}] if data entity @s Item.tag.CustomModelData if data entity @s Item.tag.display.Name at @s align x align y align z positioned ~.5 ~-1 ~.5 if block ~ ~ ~ minecraft:purple_shulker_box unless entity @e[distance=..0.1] run function test:creative_fill
execute as @a[gamemode=creative,nbt={SelectedItem:{id:"minecraft:purple_shulker_box"}}] at @s positioned ~ ~1.62 ~ run function test:creative_pickblock