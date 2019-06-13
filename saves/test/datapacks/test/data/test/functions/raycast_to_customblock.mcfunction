# particle dripping_water ~ ~ ~
execute if block ~ ~ ~ #test:shulker_box align x align y align z positioned ~.5 ~ ~.5 unless entity @e[tag=customblock,distance=..0.01,sort=nearest,limit=1] run playsound minecraft:block.shulker_box.open.replaced block @a ~ ~ ~
execute if block ~ ~ ~ #test:shulker_box align x align y align z positioned ~.5 ~ ~.5 run particle minecraft:angry_villager ~ ~1 ~

execute if block ~ ~ ~ #test:shulker_box[facing=north] align x align y align z positioned ~.5 ~ ~-.65 run kill @e[tag=wait4shlk,distance=..0.2,nbt={Rotation:[0.0f,0.01f]},limit=1]
execute if block ~ ~ ~ #test:shulker_box[facing=east] align x align y align z positioned ~1.65 ~ ~.5 run kill @e[tag=wait4shlk,distance=..0.2,nbt={Rotation:[90.0f,0.01f]},limit=1]
execute if block ~ ~ ~ #test:shulker_box[facing=south] align x align y align z positioned ~.5 ~ ~1.65 run kill @e[tag=wait4shlk,distance=..0.2,nbt={Rotation:[180.0f,0.01f]},limit=1]
execute if block ~ ~ ~ #test:shulker_box[facing=west] align x align y align z positioned ~-.65 ~ ~.5 run kill @e[tag=wait4shlk,distance=..0.2,nbt={Rotation:[270.0f,0.01f]},limit=1]
execute if block ~ ~ ~ #test:shulker_box[facing=up] align x align y align z positioned ~.5 ~1.5 ~.5 run kill @e[tag=wait4shlk,distance=..0.2,nbt={Rotation:[0.001f,90.01f]},limit=1]
execute if block ~ ~ ~ #test:shulker_box[facing=down] align x align y align z positioned ~.5 ~-1.5 ~.5 run kill @e[tag=wait4shlk,distance=..0.2,nbt={Rotation:[0.001f,-90.01f]},limit=1]

execute if block ~ ~ ~ #test:shulker_box[facing=north] align x align y align z positioned ~.5 ~ ~.5 run summon minecraft:armor_stand ~ ~ ~-1.15 {Rotation:[0.0f,0.01f],Small:1b,Invulnerable:1b,Invisible:1b,Tags:["wait4shlk"],PortalCooldown:10}
execute if block ~ ~ ~ #test:shulker_box[facing=east] align x align y align z positioned ~.5 ~ ~.5 run summon minecraft:armor_stand ~1.15 ~ ~ {Rotation:[90.0f,0.01f],Small:1b,Invulnerable:1b,Invisible:1b,Tags:["wait4shlk"],PortalCooldown:10}
execute if block ~ ~ ~ #test:shulker_box[facing=south] align x align y align z positioned ~.5 ~ ~.5 run summon minecraft:armor_stand ~ ~ ~1.15 {Rotation:[180.0f,0.01f],Small:1b,Invulnerable:1b,Invisible:1b,Tags:["wait4shlk"],PortalCooldown:10}
execute if block ~ ~ ~ #test:shulker_box[facing=west] align x align y align z positioned ~.5 ~ ~.5 run summon minecraft:armor_stand ~-1.15 ~ ~ {Rotation:[270.0f,0.01f],Small:1b,Invulnerable:1b,Invisible:1b,Tags:["wait4shlk"],PortalCooldown:10}
execute if block ~ ~ ~ #test:shulker_box[facing=up] align x align y align z positioned ~.5 ~ ~.5 run summon minecraft:armor_stand ~ ~1.5 ~ {Rotation:[0.001f,90.01f],Small:1b,Invulnerable:1b,Invisible:1b,Tags:["wait4shlk"],PortalCooldown:10}
execute if block ~ ~ ~ #test:shulker_box[facing=down] align x align y align z positioned ~.5 ~ ~.5 run summon minecraft:armor_stand ~ ~-1.5 ~ {Rotation:[0.001f,-90.01f],Small:1b,Invulnerable:1b,Invisible:1b,Tags:["wait4shlk"],PortalCooldown:10}
execute if block ~ ~ ~ minecraft:purple_shulker_box align x align y align z positioned ~.5 ~ ~.5 unless entity @e[tag=customblock,distance=..0.01,sort=nearest,limit=1] run setblock ~ ~ ~ minecraft:air destroy
execute if block ~ ~ ~ #test:raycast_cb align x align y align z positioned ~.5 ~ ~.5 as @e[tag=customblock,distance=..0.01,sort=nearest,limit=1] run function test:customblock_raycast_hit
execute unless block ~ ~ ~ #test:raycast_cb positioned ~ ~-1.6 ~ if entity @s[distance=..6] positioned ~ ~1.6 ~ positioned ^ ^ ^.1 run function test:raycast_to_customblock