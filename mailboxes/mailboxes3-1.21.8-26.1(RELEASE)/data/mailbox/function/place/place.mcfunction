# /mailbox:place/place
# Place a mailbox using ra_lib. Run as bat with ra.place.mailbox tag at spawn position.

# Tag nearest player as placer
tag @p[distance=..8] add ra.placer

# Get horizontal facing from player (dir_type 1 = horizontal only)
execute as @p[tag=ra.placer,limit=1,sort=nearest] run function ra_lib:orientation/get_facing {dir_type:1}

# Store color from entity tags for use in placement
execute if entity @s[tag=mailbox.white] run data modify storage mailbox:temp color set value "white"
execute if entity @s[tag=mailbox.light_gray] run data modify storage mailbox:temp color set value "light_gray"
execute if entity @s[tag=mailbox.gray] run data modify storage mailbox:temp color set value "gray"
execute if entity @s[tag=mailbox.black] run data modify storage mailbox:temp color set value "black"
execute if entity @s[tag=mailbox.brown] run data modify storage mailbox:temp color set value "brown"
execute if entity @s[tag=mailbox.red] run data modify storage mailbox:temp color set value "red"
execute if entity @s[tag=mailbox.orange] run data modify storage mailbox:temp color set value "orange"
execute if entity @s[tag=mailbox.yellow] run data modify storage mailbox:temp color set value "yellow"
execute if entity @s[tag=mailbox.lime] run data modify storage mailbox:temp color set value "lime"
execute if entity @s[tag=mailbox.green] run data modify storage mailbox:temp color set value "green"
execute if entity @s[tag=mailbox.cyan] run data modify storage mailbox:temp color set value "cyan"
execute if entity @s[tag=mailbox.light_blue] run data modify storage mailbox:temp color set value "light_blue"
execute if entity @s[tag=mailbox.blue] run data modify storage mailbox:temp color set value "blue"
execute if entity @s[tag=mailbox.purple] run data modify storage mailbox:temp color set value "purple"
execute if entity @s[tag=mailbox.magenta] run data modify storage mailbox:temp color set value "magenta"
execute if entity @s[tag=mailbox.pink] run data modify storage mailbox:temp color set value "pink"

# Place fence block
setblock ~ ~ ~ minecraft:oak_fence

# Spawn block displays using macro with color and rotation based on facing direction
# Mailbox faces TOWARD the player (inverted from block facing)
# North = facing 2 = rotation 0 (player looks south, mailbox faces north toward them)
# South = facing 3 = rotation 180 (player looks north, mailbox faces south toward them)
# West = facing 4 = rotation -90 (player looks east, mailbox faces west toward them)
# East = facing 5 = rotation 90 (player looks west, mailbox faces east toward them)

execute if score #facing ra.temp matches 2 run data modify storage mailbox:temp rotation set value 0
execute if score #facing ra.temp matches 3 run data modify storage mailbox:temp rotation set value 180
execute if score #facing ra.temp matches 4 run data modify storage mailbox:temp rotation set value -90
execute if score #facing ra.temp matches 5 run data modify storage mailbox:temp rotation set value 90

function mailbox:place/summon_block_display with storage mailbox:temp

# Play sound
playsound minecraft:block.stone.place block @a[distance=..16] ~ ~ ~ 1 1

# Cleanup
tag @p[tag=ra.placer] remove ra.placer
kill @s
