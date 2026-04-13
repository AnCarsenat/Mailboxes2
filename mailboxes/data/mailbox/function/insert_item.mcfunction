# Insert a single item into container 2 blocks below mailbox
# Run as marker at mailbox position

# Get the nearest item and process it
execute as @e[type=item,distance=..1.5,limit=1,sort=nearest] run function mailbox:try_insert
