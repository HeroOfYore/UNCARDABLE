G.UNCARDABLE_DECKS = {
    b_red = {pos = 0, artist = {"guac"}},
    b_blue = {pos = 1, artist = {"guac"}},
}

SMODS.Atlas {
    key = "UNBEATADECKS",
    path = "UNDECKABLE.png",
    px = 71,
    py = 95,
}



if not UNCARDABLE.config.disabled then
    
    for deck, data in pairs(G.UNCARDABLE_DECKS) do
            SMODS["Back"]:take_ownership(deck, {atlas = "UNBEATADECKS",
            pos = {x = 0 + data.pos, y = 0},
            artist_credits = data.artist,
            }, true)
        
    end
end