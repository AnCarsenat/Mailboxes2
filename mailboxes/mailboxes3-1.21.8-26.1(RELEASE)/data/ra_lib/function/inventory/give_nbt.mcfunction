# /ra_lib:inventory/give_nbt
# Insert item into container. At container position.
# Input: storage ra:inventory item {id, count, components, ...}
# Output: #slot ra.inv.slot (slot used, or -1 if full), returns 1 on success, 0 if full

# Find an empty slot
function ra_lib:inventory/find_empty_slot
execute if score #slot ra.inv.slot matches -1 run return 0

# Store slot number in storage for macro
execute store result storage ra:inventory slot int 1 run scoreboard players get #slot ra.inv.slot

# Spawn temp item_display to hold the item data
summon item_display ~ ~ ~ {Tags:["ra.temp_item"]}
data modify entity @e[type=item_display,tag=ra.temp_item,limit=1] item set from storage ra:inventory item

# Copy from entity to container slot using macro
function ra_lib:inventory/insert_slot with storage ra:inventory

# Clean up temp entity
kill @e[type=item_display,tag=ra.temp_item]
return 1
