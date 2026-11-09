G.UNCARDABLE_DECKS = {
    b_red = {pos = 0, artist = {"guac"}},
    b_blue = {pos = 1, artist = {"guac"}},
    b_yellow = {pos = 2, artist = {"guac"}},
    b_green = {pos = 3, artist = {"guac"}},
    b_black = {pos = 4, artist = {"guac"}},
    b_magic = {pos = 5, artist = {"guac"}},
    b_nebula = {pos = 6, artist = {"guac"}},
    -- b_ghost = {pos = 7, artist = {"tentative"}},
    -- b_abandoned = {pos = 8, artist = {"tentative"}},
    -- b_checkered = {pos = 9, artist = {"tentative"}},
    -- b_zodiac = {pos = 10, artist = {"tentative"}},
    -- b_painted = {pos = 11, artist = {"tentative"}},
    b_anaglyph = {pos = 12, artist = {"guac"}},
    -- b_plasma = {pos = 13, artist = {"tentative"}},
    -- b_erratic = {pos = 14, artist = {"tentative"}},
    -- b_challenge = {pos = 15, artist = {"tentative"}},
    -- Put Locked Deck Here = {pos = 16, artist = {"guac"}},
}

SMODS.Atlas {
    key = "UNBEATADECKS",
    path = "UNDECKABLE.png",
    px = 71,
    py = 95,
}

SMODS.Atlas {
    key = "locked_deck",
    path = "UNDECKLOCKABLE.png",
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


--[[local back_change = Back.change_to
function Back:change_to(new_back)
    local ret = back_change(new_back)
    if not new_back then new_back = G.P_CENTERS.b_red end
    Back.name = new_back.name or 'Red Deck'
    
    Back.effect = {
        center = new_back,
        text_UI = '',
        config = copy_table(new_back.config)
    }
    Back.loc_name = localize{type = 'name_text', set = 'Back', key = Back.effect.center.key}

    local pos = Back.effect.center.unlocked and copy_table(new_back.pos) or {x = 16, y = 0}
    Back.pos = Back.pos or {}
    Back.pos.x = pos.x
    Back.pos.y = pos.y 
end]]--