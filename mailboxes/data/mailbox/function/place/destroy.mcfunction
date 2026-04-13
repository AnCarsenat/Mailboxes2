# Destroy mailbox when fence is removed
# Run as marker (collector) at mailbox position

# Kill all block_display entities within range (base + passengers)
kill @e[type=minecraft:block_display,tag=mailbox,distance=..1]

# Kill text_display (part of passengers)
kill @e[type=minecraft:text_display,tag=mailbox,distance=..1]

# Kill self (marker)
kill @s
