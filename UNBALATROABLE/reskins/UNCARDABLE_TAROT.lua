G.UNCARDATAROT = {
    c_fool = {pos = 0, artist = {'guac'}},
    c_magician = {pos = 1, artist = {'heroofyore'}},
    c_high_priestess = {pos = 2, artist = {'heroofyore'}},
    c_empress = {pos = 3, artist = {'heroofyore'}},
    c_emperor = {pos = 4,  artist = {'heroofyore'}},
    c_heirophant = {pos = 5,  artist = {'heroofyore'}},
    c_lovers = {pos = 6, artist = {'nonexistante'}},
    c_chariot = {pos = 7,  artist = {'heroofyore'}},
    c_justice = {pos = 8, artist = {'heroofyore'}},
    c_hermit = {pos = 9,  artist = {'heroofyore'}},
    c_wheel_of_fortune = {pos = 10,  artist = {'heroofyore'}},
    c_strength = {pos = 11, artist = {'heroofyore'}},
    c_hanged_man = {pos = 12, artist = {'ploutre'}},
    c_death = {pos = 13, artist = {'heroofyore'}},
    c_temperance = {pos = 14, artist = {'heroofyore'}},
    c_devil = {pos = 15, artist = {'heroofyore'}},
    c_tower = {pos = 16, artist = {'heroofyore'}},
    c_star = {pos = 17, artist = {'heroofyore'}},
    c_moon = {pos = 18, artist = {'ploutre'}},
    c_sun = {pos = 19, artist = {'heroofyore'}},
    c_judgement = {pos = 20, artist = {'heroofyore'}},
    c_world = {pos = 21, artist = {'heroofyore'}},
}


SMODS.Atlas {
    key = 'uncardatarot',
    path = 'UNTAROTABLE.png',
    px = 71,
    py = 95,
    disable_mipmap = true;
}

SMODS.Atlas {
    key = 'uncardatarot_reimagined',
    path = 'UNTAROTABLE_REIMAGINED.png',
    px = 71,
    py = 95,
    disable_mipmap = true;
}

if UNCARDABLE.config.tarotoriginal then
    for tarot, data in pairs(G.UNCARDATAROT) do
        SMODS["Consumable"]:take_ownership(tarot, {atlas = "uncardatarot",
        pos = {x = 0 + data.pos, y = 0},
        artist_credits = data.artist,
        }, true)
    end
else
    for tarot, data in pairs(G.UNCARDATAROT) do
        SMODS["Consumable"]:take_ownership(tarot, {atlas = "uncardatarot_reimagined",
        pos = {x = 0 + data.pos, y = 0},
        artist_credits = data.artist,
        }, true)
    end
end