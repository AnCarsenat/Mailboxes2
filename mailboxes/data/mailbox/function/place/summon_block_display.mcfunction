# Project created via BDStudio - Single block_display with Passengers
# https://eszesbalint.github.io/bdstudio
# Macro parameters: color (terracotta color), rotation (yaw angle)

# Summon a marker as base entity with mailbox tag (stays at fence level for detection)
$summon marker ~ ~ ~ {Tags:["mailbox_collector","mailbox_base","mailbox.new"],Rotation:[$(rotation)f,0f]}

# Summon single block_display with all parts as Passengers (offset by -0.5 to center, ~0.5 for slightly above fence)
# Note: Passengers don't inherit rotation, so we apply it after with tp command
$execute as @e[type=marker,tag=mailbox.new,limit=1,distance=..1] at @s run summon block_display ~ ~0.8 ~ {Tags:["mailbox","mailbox_base_display","mailbox_new_display"],Passengers:[{id:"minecraft:block_display",Tags:["mailbox","mailbox_part","mailbox_new_display"],block_state:{Name:"minecraft:$(color)_terracotta",Properties:{}},transformation:[0.5000f,0.0000f,0.0000f,-0.2500f,0.0000f,0.5625f,0.0000f,0.0000f,0.0000f,0.0000f,0.9375f,-0.4375f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",Tags:["mailbox","mailbox_part","mailbox_new_display"],block_state:{Name:"minecraft:iron_trapdoor",Properties:{facing:"east",half:"bottom",open:"false"}},transformation:[0.5000f,0.0000f,0.0000f,-0.2500f,0.0000f,0.4375f,0.0000f,0.0000f,0.0000f,0.0000f,0.4375f,-0.8750f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",Tags:["mailbox","mailbox_part","mailbox_new_display"],block_state:{Name:"minecraft:redstone_torch",Properties:{lit:"true"}},transformation:[0.8000f,0.0000f,0.0000f,-0.6875f,0.0000f,0.7500f,0.0000f,0.1250f,0.0000f,0.0000f,0.8000f,-0.6875f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:text_display",Tags:["mailbox","mailbox_text","mailbox_new_display"],text:{"text":"Mailbox","color":"#FFFFFF","bold":"false","italic":"false","underlined":"false","strikethrough":"false","font":"minecraft:uniform"},text_opacity:255,background:0,alignment:"center",line_width:210,default_background:false,transformation:[-0.0000f,0.0000f,1.0000f,0.2600f,0.0000f,1.0000f,0.0000f,0.2500f,-1.0000f,0.0000f,-0.0000f,0.0625f,0.0000f,0.0000f,0.0000f,1.0000f]}]}

# Apply rotation to all newly spawned display entities (passengers don't inherit rotation)
# Use positioned execution from marker to ensure we only affect THIS mailbox's entities
$execute as @e[type=marker,tag=mailbox.new,limit=1,distance=..1] at @s run function mailbox:place/apply_rotation {rotation:$(rotation)}

# Remove temporary tag from entities near this marker only
execute as @e[type=marker,tag=mailbox.new,limit=1,distance=..1] at @s run tag @e[tag=mailbox_new_display,distance=..2] remove mailbox_new_display

# Set color tag on marker
execute as @e[tag=mailbox.new,limit=1] run function mailbox:place/set_color

# Cleanup new tag
tag @e[tag=mailbox.new] remove mailbox.new