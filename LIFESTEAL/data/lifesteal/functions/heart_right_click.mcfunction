#kill @e[type=armor_stand, tag=ls_rightClickDetector]
#summon armor_stand ~ ~1 ~ {NoGravity:1b, NoBasePlate:1b, ShowArms:1b, Small:1b, Tags:[ls_rightClickDetector]}
scoreboard players set @s last_tick_heart_check 1
execute unless entity @e[type=armor_stand, tag=ls_rightClickDetector, distance=..1] run scoreboard players set @s last_tick_heart_check 0

execute unless entity @e[type=armor_stand, tag=ls_rightClickDetector] run summon armor_stand ~ ~1 ~ {NoGravity:1b, NoBasePlate:1b, ShowArms:1b, Small:1b, Invisible:1b, Tags:[ls_rightClickDetector]}

tp @e[type=armor_stand, tag=ls_rightClickDetector] ~ ~0.8 ~
#say hej
execute as @e[type=armor_stand, tag=ls_rightClickDetector] at @s if data entity @s HandItems[0].tag.Heart as @a[distance=..1, limit=1, sort=nearest] run function lifesteal:use_heart
execute as @e[type=armor_stand, tag=ls_rightClickDetector] at @s if data entity @s HandItems[0].tag.Heart run kill @s

#execute as @e[type=armor_stand, tag=ls_rightClickDetector] at @s unless data entity @s HandItems[0].tag.Heart as @a[distance=..1, limit=1, sort=nearest] run scoreboard players set @s last_tick_heart_check 1