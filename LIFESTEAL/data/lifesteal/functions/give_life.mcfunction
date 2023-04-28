#give @s minecraft:firework_star{Explosion:{Type:0b, Colors:[I;11743532]},display:{Name:'[{"text":"Heart","italic":false,"color":"red"}]',Lore:['[{"text":"Right click to use","italic":false}]']},Enchantments:[{}],Heart:1b}



setblock 0 -64 0 minecraft:oak_sign{Text1:'{"selector":"@p"}'}

summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:firework_star", Count:1b, tag:{owner:"none", Explosion:{Type:0b, Colors:[I;11743532]},display:{Name:'[{"text":"Heart","italic":false,"color":"red"}]',Lore:['[{"text":"Right click to use","italic":false}]']},Enchantments:[{}],Heart:1b}}}

execute as @e[type=item, distance=..1, nbt={Item:{id:"minecraft:firework_star", Count:1b, tag:{owner:"none", Explosion:{Type:0b, Colors:[I;11743532]},display:{Name:'[{"text":"Heart","italic":false,"color":"red"}]',Lore:['[{"text":"Right click to use","italic":false}]']},Enchantments:[{}],Heart:1b}}}] run data modify entity @s Item.tag.owner set from block 0 -64 0 Text1

setblock 0 -64 0 bedrock



scoreboard players remove @s ls_health 1