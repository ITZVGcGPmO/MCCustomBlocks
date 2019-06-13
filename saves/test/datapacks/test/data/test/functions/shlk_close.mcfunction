say closed!
execute if block ~ ~ ~ #test:shulker_box unless entity @e[tag=customblock,distance=..0.01] run playsound minecraft:block.shulker_box.close.replaced block @a ~ ~.5 ~
# execute as @e[tag=customblock,distance=..0.01] at @s run function #test:gui_close
kill @s