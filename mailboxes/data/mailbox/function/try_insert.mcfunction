# Try to insert this item into container below mailbox
# Run as item entity

# Tag this specific item
tag @s add mailbox_inserting

# Copy item data to storage (remove Slot if present)
data modify storage ra:inventory item set from entity @s Item
data remove storage ra:inventory item.Slot

# Try insertion at container position (2 blocks below mailbox marker)
execute at @e[type=marker,tag=mailbox_collector,distance=..2,limit=1] positioned ~ ~-2 ~ if block ~ ~ ~ #ra_lib:containers run function mailbox:do_insert

# If insertion failed or no container, drop item below the mailbox
execute if entity @s[tag=mailbox_inserting] at @e[type=marker,tag=mailbox_collector,distance=..2,limit=1] run tp @s ~ ~-2 ~
execute if entity @s[tag=mailbox_drop] at @e[type=marker,tag=mailbox_collector,distance=..2,limit=1] run tp @s ~ ~-2 ~

# Clean up tags
tag @s remove mailbox_inserting
tag @s remove mailbox_drop
