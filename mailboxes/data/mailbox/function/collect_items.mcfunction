# Collect items near mailbox and insert into container 2 blocks below
# Run as marker at mailbox position
# Structure: Fence (Y) -> Cover block (Y-1) -> Container (Y-2)

# Process each item nearby one at a time
execute if entity @e[type=item,distance=..1.5,limit=1] run function mailbox:insert_item
