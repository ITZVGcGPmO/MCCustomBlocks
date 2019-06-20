execute positioned ^ ^ ^32 as @e[tag=customblock,distance=..32] run tag @s add withinrender
execute as @e[tag=customblock,distance=..32,tag=withinrender,limit=20,sort=nearest] run data merge entity @s {PortalCooldown:10}
execute as @e[tag=customblock,tag=!rendered] unless entity @s[nbt={PortalCooldown:0}] at @s run setblock ~ ~1 ~ stone
execute as @e[tag=customblock,tag=!rendered] unless entity @s[nbt={PortalCooldown:0}] run tag @s add rendered
execute as @e[tag=customblock,tag=rendered,nbt={PortalCooldown:0}] at @s run setblock ~ ~1 ~ air
execute as @e[tag=customblock,tag=rendered,nbt={PortalCooldown:0}] run tag @s remove rendered
execute as @e[tag=customblock,tag=withinrender] run tag @s remove withinrender