G.UNCARDABLE_SEALS = {
    Gold = {pos = 0, artist = "guac"},
    Purple = {pos = 1,artist = "guac"},
    Red = {pos = 2, artist = "guac"},
    Blue = {pos = 3, artist = "guac"},
}


SMODS.Atlas {
    key = "unsealable",
    path = "UNSEALABLE.png",
    px = 71,
    py = 95,
}


if not UNCARDABLE.config.disabled then
    for seal, data in pairs(G.UNCARDABLE_SEALS) do
        SMODS["Seal"]:take_ownership(seal, {
            atlas = "unsealable",
            pos = {x = 0+data.pos, y = 0},
            artist_credits = data.artist,
        }, true)
    end
end