# ========================== WELCOME MESSAGE ==========================
# Welcome message
tellraw @a [{"text":"[","color":"dark_gray"},{"text":"Mailbox","color":"gold","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Mailboxes v2.0.0 loaded!","color":"green"}]
tellraw @a [{"text":"Use ","color":"gray"},{"text":"/function mailbox:give_all","color":"yellow","hover_event":{"action":"show_text","value":"Give all mailbox items"},"click_event":{"action":"suggest_command","command":"/function mailbox:give_all"}},{"text":" to get items","color":"gray"}]

# Initialize ra_lib placement system
function ra_lib:placement/init

# Initialize scoreboard for ra_lib
scoreboard objectives add ra.temp dummy
scoreboard objectives add ra.facing dummy
scoreboard objectives add ra.yaw dummy
scoreboard objectives add ra.pitch dummy
scoreboard objectives add ra.inv.slot dummy
scoreboard objectives add ra.inv.count dummy

# Initialize default storage values
data modify storage mailbox:temp color set value "white"
data modify storage mailbox:temp rotation set value 0

# Start tick loop
schedule function mailbox:tick 1t