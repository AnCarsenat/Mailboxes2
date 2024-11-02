import os, shutil
hexcolors = {
    'white': '#cfaf9f', 
    'light_gray': '#856a5f', 
    'gray': '#9f5325', 
    'black': '#261811', 
    'brown': '#663333', 
    'red': '#8f3e2f', 
    'orange': '#9f5325', 
    'yellow': '#b88323', 
    'lime': '#647231', 
    'green': '#4a5127', 
    'cyan': '#697b80', 
    'light_blue': '#757099', 
    'blue': '#493a59', 
    'purple': '#764755', 
    'magenta': '#93576c', 
    'pink': '#9f4d4d'
}

colors = list(hexcolors.keys())

#empty directories
for path in ["recipes", "advancements", "functions/crafted_mailbox", "functions/summon"]:
    if os.path.exists(path) and os.path.isdir(path):
        shutil.rmtree(path)
    os.mkdir(path)

#load templates
with open("script_templates/recipe_template.json", "rb") as file:
    recipe_template = file.read().decode("utf-8")

with open("script_templates/adv_template.json", "rb") as file:
    adv_template = file.read().decode("utf-8")

with open("script_templates/craft_item_template.mcfunction", "rb") as file:
    craft_item_template = file.read().decode("utf-8")

facing_templates: dict[str, str] = {}

facings = [(1,"south"), (2,"west"), (3,"north"), (4, "east")]

for fnum, fname in facings:
    with open("script_templates/"+fname+".mcfunction", "rb") as file:
        facing_templates[fname] = file.read().decode("utf-8")


#create the summoning manager
total = "#create mailbox\n\n"
for fnum, fname in facings:
    for color in colors:
        line = f"execute as @e[type=bat,name=mailbox_gen_{color}] at @s if score @p playerfacing matches {fnum} run function mailbox:summon/{color}/{fname}\n"
        total += line
total += "\nexecute as @e[tag=mailbox] run data modify entity @s Fire set value 100\n\n"

total +="""execute as @e[type=minecraft:armor_stand, tag=mailbox_collector] at @s if block ~ ~-1 ~ air run kill @e[type=minecraft:armor_stand, tag=mailbox, limit=4,sort=nearest]
execute as @e[type=minecraft:armor_stand, tag=mailbox_collector] at @s if block ~ ~-1 ~ air run setblock ~ ~ ~ air

"""
for color in colors:
    item_name=color+" mailbox"
    display_string = """display:{Name:'[{"text":\""""+item_name+'\","italic":false,"color":"'+hexcolors[color]+"""\"}]\'}"""
    total+='execute as @e[type=minecraft:armor_stand, tag=mailbox_color_'+color+'] at @s if block ~ ~-1 ~ air run summon item ~ ~1 ~ {Item:{id:"minecraft:enderman_spawn_egg",Count:1,tag:{'+display_string+', Enchantments:[{id:"minecraft:none",lvl:1}], EntityTag:{id:"minecraft:bat",CustomName:"\\"mailbox_gen_'+color+'\\"",NoAI:1b,NoGravity:1b,Silent:1,ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}]}}}}\n'
total+="""\nexecute as @e[type=minecraft:armor_stand, tag=mailbox_collector] at @s if block ~ ~-1 ~ air run kill @s"""

with open("functions/summon/manager.mcfunction", "wb") as file:
    file.write(total.encode("utf-8"))



#create crafts and placements for each color of mailbox
for i in colors:
    #set up the recipes
    file_name = i + "_mailbox_recipe.json"
    formated_recipe = recipe_template.format(color=i)
    with open("recipes/"+file_name, "wb") as file:
        file.write(formated_recipe.encode("utf-8"))
    #set up the triggering advancements
    file_name = i + "_mailbox_adv.json"
    formated_adv = adv_template.format(color=i)
    with open("advancements/"+file_name, "wb") as file:
        file.write(formated_adv.encode("utf-8"))
    #create the function that executes the craft
    file_name = i + ".mcfunction"
    formated_crafter = craft_item_template.format(color=i, hexcolor=hexcolors[i])
    with open("functions/crafted_mailbox/"+file_name, "wb") as file:
        file.write(formated_crafter.encode("utf-8"))

    #create the summoning directory
    dirpath = "functions/summon/"+i
    os.mkdir(dirpath)
    for fnum, fname in facings:
        with open(dirpath+"/"+fname+".mcfunction", "wb") as file:
            file.write(facing_templates[fname].format(color=i).encode("utf-8"))
        
        
    
    