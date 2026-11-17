G.UNCARDABLE_STAKES = {
    stake_white = {pos = 0, artist = {"heroofyore"}},
    stake_red = {pos = 1, artist = {"heroofyore"}},
    stake_green = {pos = 2, artist = {"heroofyore"}},
    stake_black = {pos = 3, artist = {"heroofyore"}},
    stake_blue = {pos = 4, artist = {"heroofyore"}},
    stake_purple = {pos = 5, artist = {"heroofyore"}},
    --stake_orange = {pos = 6, artist = {"heroofyore"}},
    stake_gold = {pos = 7, artist = {"guac"}},
}

G.UNCARDABLE_STAKESTICKERS = {
    White = {pos = 0, artist = {"heroofyore"}},   
    Red = {pos = 1, artist = {"heroofyore"}},   
    Green = {pos = 2, artist = {"heroofyore"}},   
    Black = {pos = 3, artist = {"heroofyore"}},   
    Blue = {pos = 4, artist = {"heroofyore"}},
    Purple = {pos = 5, artist = {"heroofyore"}},
    Orange = {pos = 6, artist = {"heroofyore"}},  
    --Gold = {pos = 3, artist = {"guac"}}, 
}

SMODS.Atlas {
    key = "unstakeable",
    path = "UNSTAKEABLE.png",
    px = 29,
    py = 29,
}

SMODS.Atlas{
    key = "unstickerable",
    path = "UNSTICKERABLE.png",
    px = 71,
    py = 95,
}



if not UNCARDABLE.config.disabled then
    for stake, data in pairs(G.UNCARDABLE_STAKES) do
        SMODS["Stake"]:take_ownership(stake, {
            atlas = "unstakeable",
            pos = {x = 0+data.pos, y = 0},
            artist_credits = data.artist,
        }, true)
    end
    for sticker, data in pairs(G.UNCARDABLE_STAKESTICKERS) do
        SMODS["Sticker"]:take_ownership(sticker, {
            atlas = "unstickerable",
            pos = {x = 0 + data.pos, y = 0},
            artist_credits = data.artist,
        }, true)
end