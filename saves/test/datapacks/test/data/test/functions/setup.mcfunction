scoreboard objectives add mdata dummy
scoreboard objectives add cbl_load dummy
# increase revision number with every reload, w/overflow
scoreboard players add # cbl_load 1
scoreboard players set #lpbk cbl_load 65536
scoreboard players operation # cbl_load %= #lpbk cbl_load
scoreboard players reset #lpbk cbl_load
scoreboard objectives add open_sh_bx minecraft.custom:minecraft.open_shulker_box
scoreboard objectives add touch_beacon minecraft.custom:minecraft.interact_with_beacon
scoreboard objectives add pl_sh_bx minecraft.used:minecraft.shulker_box
scoreboard objectives add bat_spawn minecraft.used:minecraft.bat_spawn_egg