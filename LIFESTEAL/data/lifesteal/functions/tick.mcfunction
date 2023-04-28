scoreboard players add tick ls_tick 1
execute if score tick ls_tick matches 21.. run scoreboard players reset tick ls_tick



# Sends a info messege to every player that joins the server
function lifesteal:join_messege



# Checks if the player joins for the first time
execute as @a store success score @s ls_firstJoin run scoreboard players get @s ls_firstJoin



# Resets the players health if the player joins for the first time
execute as @a[scores={ls_firstJoin=0}] run scoreboard players set @s ls_health 10



execute as @r[nbt={SelectedItem:{tag:{Heart:1b}}}, gamemode=!spectator] at @s run function lifesteal:heart_right_click
execute as @r[scores={last_tick_heart_check=1}, gamemode=!spectator] at @s run function lifesteal:heart_right_click
execute unless entity @a[nbt={SelectedItem:{tag:{Heart:1b}}}, gamemode=!spectator] run kill @e[type=armor_stand, tag=ls_rightClickDetector]
###execute as @r[scores={ls_saved_selected_heart_item=1}] at @s run function lifesteal:heart_right_click
###execute unless entity @a[scores={ls_saved_selected_heart_item=1}] run kill @e[type=armor_stand, tag=ls_rightClickDetector]

###execute as @a store success score @s ls_saved_selected_heart_item if entity @s[nbt={SelectedItem:{tag:{Heart:1b}}}]



# Checks if a player has killed another player and then gives him a life
execute as @a[scores={ls_killedPlayer=1..}] run scoreboard players add @s ls_health 1

# Checks if a player has been killed and then takes a life from him
execute as @a[scores={ls_death=1..}] run scoreboard players remove @s ls_health 1



# Keeps track of how meny completed kills a player has
execute as @a[scores={ls_killedPlayer=1..}] at @s if entity @a[scores={ls_death=1.., ls_health=0}] run scoreboard players add @s ls_completedKills 1
execute as @a[scores={ls_killedPlayer=1..}] at @s if entity @a[scores={ls_death=1.., ls_health=0}] run say hej


# Updates the advancements
function lifesteal:advancements


# Checks if any player wants to extract a life and if yes then gives them a life
execute as @r[scores={extlf=1.., ls_health=..1}] run tellraw @s {"text":"You can not extract a heart if you have 1 or less hearts","color":"red"}
execute as @r[scores={extlf=1..}, gamemode=spectator] run tellraw @s {"text":"You can not extract a heart if you are in spectator","color":"red"}
execute as @r[scores={extlf=1.., ls_health=2..}, gamemode=!spectator] at @s run function lifesteal:give_life
scoreboard players reset @a extlf


# Updates the player health bar
execute as @a run function lifesteal:health_check
execute as @a[scores={ls_health=..0}] if score @s ls_banned matches 1.. run scoreboard players set @s ls_health 10
execute store result score @a[scores={ls_health=..0}] ls_ban_tick run scoreboard players get tick ls_tick
execute as @a[scores={ls_health=..0}] if score @s ls_ban_tick = tick ls_tick run scoreboard players set @s ls_banned 1
execute as @a unless score @s ls_ban_tick = tick ls_tick run scoreboard players set @s ls_banned 0
execute if score ban_on_death ls_global_settings matches 1 run function lifesteal:death_ban
execute unless score ban_on_death ls_global_settings matches 1 run gamemode spectator @a[scores={ls_health=..0}]


# Resets all of the scores
scoreboard players set @a ls_killedPlayer 0
scoreboard players set @a ls_death 0
scoreboard players set @a ls_leave 0

scoreboard players enable @a extlf