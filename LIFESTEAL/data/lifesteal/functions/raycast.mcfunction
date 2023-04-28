summon armor_stand ~ ~ ~ {Tags:["raycast"]}
execute as @e[type=armor_stand, tag=raycast] at @s run tp @s ^ ^ ^1
execute as @e[type=armor_stand, tag=raycast] at @s if block ~ ~ ~ air run function lifesteal:raycast