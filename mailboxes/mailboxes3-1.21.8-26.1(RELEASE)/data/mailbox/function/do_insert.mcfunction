# Insert item from storage into container at current position
# Run at container position (~ ~-2 ~ from mailbox)
# Input: storage ra:inventory item, item entity tagged mailbox_inserting

# Try to insert using ra_lib (returns 1 on success, 0 if full)
execute store result score #inserted ra.temp run function ra_lib:inventory/give_nbt

# If successful, kill the item and remove tag
execute if score #inserted ra.temp matches 1 as @e[type=item,tag=mailbox_inserting,limit=1] run kill @s

# If failed (inventory full), mark item to be dropped
execute if score #inserted ra.temp matches 0 as @e[type=item,tag=mailbox_inserting,limit=1] run tag @s add mailbox_drop
