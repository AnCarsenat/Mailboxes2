recipe take @s mailbox:{color}_mailbox_recipe

advancement revoke @s only mailbox:{color}_mailbox_adv 

give @s minecraft:enderman_spawn_egg{{display:{{Name:'[{{"text":"{color} mailbox","italic":false,"color":"{hexcolor}"}}]'}}, Enchantments:[{{id:"minecraft:none",lvl:1}}], EntityTag:{{id:"minecraft:bat",CustomName:"\"mailbox_gen_{color}\"",NoAI:1b,NoGravity:1b,Silent:1,ActiveEffects:[{{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}}]}}}}

clear @s minecraft:knowledge_book

