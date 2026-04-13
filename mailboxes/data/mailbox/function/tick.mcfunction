# Handle mailbox placement from spawn eggs with ra.place.mailbox tag
execute as @e[type=minecraft:bat,tag=ra.place.mailbox] at @s run function mailbox:place/place

# Item collection functionality - insert items dropped near mailbox into container 2 blocks below
# The container is hidden under one block layer (fence at Y, block at Y-1, container at Y-2)
execute as @e[type=minecraft:marker,tag=mailbox_collector] at @s run function mailbox:collect_items

# Mailbox destruction when fence is broken
execute as @e[type=minecraft:marker,tag=mailbox_collector] at @s unless block ~ ~ ~ minecraft:oak_fence run function mailbox:place/destroy

schedule function mailbox:tick 1t