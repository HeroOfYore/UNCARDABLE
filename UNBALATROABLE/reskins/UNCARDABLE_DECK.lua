G.UNCARDABLE_DECKS = {
    b_red = {pos = 0, artist = {"guac"}},
    b_blue = {pos = 1, artist = {"guac"}},
    b_yellow = {pos = 2, artist = {"guac"}},
    b_green = {pos = 3, artist = {"guac"}},
    b_black = {pos = 4, artist = {"guac"}},
    b_magic = {pos = 5, artist = {"guac"}},
    -- b_nebula = {pos = 6, artist = {"tentative"}},
    -- b_ghost = {pos = 7, artist = {"tentative"}},
    -- b_abandoned = {pos = 8, artist = {"tentative"}},
    -- b_checkered = {pos = 9, artist = {"tentative"}},
    -- b_zodiac = {pos = 10, artist = {"tentative"}},
    -- b_painted = {pos = 11, artist = {"tentative"}},
    b_anaglyph = {pos = 12, artist = {"guac"}},
    -- b_plasma = {pos = 12, artist = {"tentative"}},
    -- b_erratic = {pos = 13, artist = {"tentative"}},
    -- b_challenge = {pos = 14, artist = {"tentative"}},
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