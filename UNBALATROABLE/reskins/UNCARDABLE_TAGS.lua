
G.UNCARDABLE_TAGS = {
    tag_rare = {row = 0, artist = {"heroofyore"}, anim = "tag_rare_anim"},
    tag_uncommon = {row = 0, artist = {"guac"}, anim = "tag_uncommon_anim"},
    tag_boss = {row = 0, artist = {"ribbown", "guac"}, anim = "tag_boss_anim"},
    tag_double = {row = 0, artist = {'guac'}},
}

SMODS.Atlas {
    key = "tag_rare_anim",
    path = "TAGS/UNRAREABLE.png",
    atlas_table = "ANIMATION_ATLAS",
    frames = 13,
    fps = 10,
    px = 34,
    py = 34,
}

SMODS.Atlas {
    key = "tag_uncommon_anim",
    path = "TAGS/UNUNCOMMONABLE.png",
    atlas_table = "ANIMATION_ATLAS",
    frames = 13,
    fps = 10,
    px = 34,
    py = 34,
}

SMODS.Atlas {
    key = "tag_boss_anim",
    path = "TAGS/UNBOSSABLE.png",
    atlas_table = "ANIMATION_ATLAS",
    frames = 75,
    fps = 60,
    px = 34,
    py = 34,
}

SMODS.Atlas {
    key = "tag_double",
    path = "TAGS/UNANAGLYPHABLE.png",
    px = 34,
    py = 34,
}

if not UNCARDABLE.config.disabled
then
    for tag, data in pairs(G.UNCARDABLE_TAGS) do
        if data.anim ~= nil
        then 
            SMODS["Tag"]:take_ownership(tag, {atlas = tag .. "_anim",
            pos = {x = 0, y = 0},
            artist_credits = data.artist
            }, true)
        else
            SMODS["Tag"]:take_ownership(tag, {atlas = tag,
            pos = {x = 0, y = 0},
            artist_credits = data.artist
            }, true)
        end
    end
end