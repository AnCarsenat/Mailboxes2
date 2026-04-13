# /ra_lib:inventory/insert_slot {slot:N}
# Insert item from temp entity into container slot. At container position.
# Input: $(slot) - slot number, ra.temp_item entity with item data

$item replace block ~ ~ ~ container.$(slot) from entity @e[type=item_display,tag=ra.temp_item,limit=1] contents
