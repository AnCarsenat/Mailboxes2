execute as @a[y_rotation=-45..45] run scoreboard players set @s playerfacing 1
#south
execute as @a[y_rotation=45..135] run scoreboard players set @s playerfacing 2
#west
execute as @a[y_rotation=135..225] run scoreboard players set @s playerfacing 3
#north
execute as @a[y_rotation=225..315] run scoreboard players set @s playerfacing 4
#east

function mailbox:summon/manager

#functionality
execute as @e[type=minecraft:armor_stand, tag=mailbox_collector] at @s if entity @e[type=item,distance=..1] run tp @e[type=item,distance=..1] ~ ~-2 ~