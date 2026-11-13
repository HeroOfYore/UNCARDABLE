G.UNCARDABLE_BOOSTERS = {
    p_celestial_normal_1 = {pos = 0, artist = {'guac'},},
    p_celestial_normal_2 = {pos = 1, artist = {'guac'},},
    p_buffoon_mega_1 = {pos = 2, artist = {'heroofyore', 'stanza', 'guac'},},
    p_buffoon_normal_1 = {pos = 3, artist = {'heroofyore', 'stanza', 'guac'},},
    p_buffoon_normal_2 = {pos = 4, artist = {'stanza', 'guac'},},
    p_buffoon_jumbo_1 = {pos = 5, artist = {'heroofyore', 'stanza', 'guac'},},
    p_spectral_normal_1 = {pos = 6, artist = {'guac'},},
    p_spectral_normal_2 = {pos = 7, artist = {'guac'},},
    p_spectral_jumbo_1 = {pos = 8, artist = {'guac'},},
    p_spectral_mega_1 = {pos = 9, artist = {'guac'},},
    p_arcana_normal_1 = {pos = 10, artist = {'heroofyore'},},
    p_arcana_normal_2 = {pos = 11, artist = {'heroofyore'},},
    p_arcana_normal_3 = {pos = 12, artist = {'heroofyore'},},
    p_arcana_normal_4 = {pos = 13, artist = {'heroofyore'},},

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