recipe take @s mailbox:gray_mailbox_recipe

advancement revoke @s only mailbox:gray_mailbox_adv 

give @s minecraft:enderman_spawn_egg{display:{Name:'[{"text":"gray mailbox","italic":false,"color":"#9f5325"}]'}, Enchantments:[{id:"minecraft:none",lvl:1}], EntityTag:{id:"minecraft:bat",CustomName:"\"mailbox_gen_gray\"",NoAI:1b,NoGravity:1b,Silent:1,ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}]}}

clear @s minecraft:knowledge_book
