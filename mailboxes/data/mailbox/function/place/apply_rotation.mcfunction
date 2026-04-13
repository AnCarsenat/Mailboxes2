# Apply rotation to newly spawned mailbox display entities
# Run as marker at mailbox position
# Macro parameter: rotation (yaw angle)

# Teleport all new display entities near this marker to apply rotation
$execute as @e[tag=mailbox_new_display,distance=..2] at @s run tp @s ~ ~ ~ $(rotation) 0
