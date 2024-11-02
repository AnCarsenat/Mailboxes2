execute run summon armor_stand ~ ~ ~ {Invisible:1,NoGravity:1, Invulnerable:1b, Tags:[mailbox_collector, mailbox_color_pink], DisabledSlots:2096896}

execute run summon armor_stand ~-.3 ~-0.5 ~ {Invisible:1,NoGravity:1,Invulnerable:1b,ArmorItems:[{},{},{},{id:pink_terracotta,Count:1b}], Tags:[mailbox], DisabledSlots:2096896, Marker:1b, Fire:100}
execute run summon armor_stand ~.1 ~-0.5 ~ {Invisible:1,NoGravity:1,Invulnerable:1b,ArmorItems:[{},{},{},{id:pink_terracotta,Count:1b}], Tags:[mailbox], DisabledSlots:2096896, Marker:1b, Fire:100}
execute run summon armor_stand ~-0.15 ~-0.75 ~0.05 {Rotation:[180.0f, 0.0f],Invisible:1,NoGravity:1,Invulnerable:1b,ArmorItems:[{},{},{},{id:tripwire_hook,Count:1b}], Pose:{Head:[0.0f,0.0f,45.0f]}, Tags:[mailbox], DisabledSlots:2096896, Marker:1b, Fire:100}
execute run summon armor_stand ~-0.75 ~-0.45 ~ {Invisible:1,NoGravity:1,Invulnerable:1b,ArmorItems:[{},{},{},{id:heavy_weighted_pressure_plate,Count:1b}], Pose:{Head:[0.0f,0.0f,-15.0f]}, Tags:[mailbox], DisabledSlots:2096896, Marker:1b, Fire:100}

execute run setblock ~ ~ ~ minecraft:oak_fence
execute run kill @s