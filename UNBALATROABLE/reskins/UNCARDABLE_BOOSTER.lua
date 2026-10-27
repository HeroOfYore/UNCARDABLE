G.UNCARDABLE_BOOSTERS = {
    p_celestial_normal_1 = {pos = 0, artist = {"guac"},},
    p_celestial_normal_2 = {pos = 1, artist = {"guac"},},
}

SMODS.Atlas {
    key = "UNCARDABOOSTERS",
    path = "UNCARDABOOSTERS.png",
    px = 71,
    py = 95,
}

if not UNCARDABLE.config.disabled then
    for booster, data in pairs(G.UNCARDABLE_BOOSTERS) do
        SMODS.Booster:take_ownership(booster, {
            atlas = "UNCARDABOOSTERS",
            pos = {x = 0 + data.pos, y = 0},
            artist_credits = data.artist,
        }, true)
    end

end