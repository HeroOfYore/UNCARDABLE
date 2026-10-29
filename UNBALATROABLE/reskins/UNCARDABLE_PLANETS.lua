G.UNCARDABLE_planets = {
    c_mercury = {pos = 0, variants = 4, artist = {'guac'}},
    c_venus = {pos = 1, variants = 2, artist = {'guac'}},
    c_earth = {pos = 2, variants = 1, artist = {'guac'}},
    c_mars = {pos = 3, variants = 2, artist = {'guac'}},
    c_jupiter = {pos = 4, variants = 1, artist = {'guac'}},
    c_saturn = {pos = 5, variants = 3, artist = {'guac'}},
    c_uranus = {pos = 6, variants = 1, artist = {'guac'}},
    c_neptune = {pos = 7, variants = 1, artist = {'guac'}},
    c_pluto = {pos = 8, variants = 2, artist = {'guac'}},
    c_planet_x = {pos = 9, variants = 3, artist = {'guac'}},
    c_ceres = {pos = 10, variants = 2, artist = {'guac'}},
    c_eris = {pos = 11, variants = 1, artist = {'guac'}},
}

SMODS.Atlas {
    key = "c_mercury_anim",
    path = "UNPLANETABLE/UNMERCURYABLE.png",
    atlas_table = 'ANIMATION_ATLAS',
    frames = 11,
    fps = 10,
    px = 71,
    py = 95,
}

SMODS.Atlas {
    key = "c_venus_anim",
    path = "UNPLANETABLE/UNVENUSABLE.png",
    atlas_table = 'ANIMATION_ATLAS',
    frames = 21,
    fps = 10,
    px = 71,
    py = 95,
}

SMODS.Atlas {
    key = "c_earth_anim",
    path = "UNPLANETABLE/UNEARTHABLE.png",
    atlas_table = 'ANIMATION_ATLAS',
    frames = 21,
    fps = 10,
    px = 71,
    py = 95,  
}

SMODS.Atlas {
    key = "c_mars_anim",
    path = "UNPLANETABLE/UNMARSABLE.png",
    atlas_table = 'ANIMATION_ATLAS',
    frames = 21,
    fps = 10,
    px = 71,
    py = 95,
}

SMODS.Atlas {
    key = "c_jupiter_anim",
    path = "UNPLANETABLE/UNJUPITABLE.png",
    atlas_table = 'ANIMATION_ATLAS',
    frames = 21,
    fps = 10,
    px = 71,
    py = 95,
}

SMODS.Atlas {
    key = "c_saturn_anim",
    path = "UNPLANETABLE/UNSATURNABLE.png",
    atlas_table = 'ANIMATION_ATLAS',
    frames = 21,
    fps = 10,
    px = 71,
    py = 95,
}

SMODS.Atlas {
    key = "c_uranus_anim",
    path = "UNPLANETABLE/UNURANUSABLE.png",
    atlas_table = 'ANIMATION_ATLAS',
    frames = 11,
    fps = 10,
    px = 71,
    py = 95,
}

SMODS.Atlas {
    key = "c_neptune_anim",
    path = "UNPLANETABLE/UNNEPTUNABLE.png",
    atlas_table = 'ANIMATION_ATLAS',
    frames = 21,
    fps = 10,
    px = 71,
    py = 95,
}

SMODS.Atlas {
    key = "c_pluto_anim",
    path = "UNPLANETABLE/UNPLUTOABLE.png",
    atlas_table = 'ANIMATION_ATLAS',
    frames = 11,
    fps = 10,
    px = 71,
    py = 95,
}

SMODS.Atlas {
    key = "c_planet_x_anim",
    path = "UNPLANETABLE/UNPLANETXABLE.png",
    atlas_table = 'ANIMATION_ATLAS',
    frames = 21,
    fps = 10,
    px = 71,
    py = 95,
}

SMODS.Atlas {
    key = "c_ceres_anim",
    path = "UNPLANETABLE/UNCERESABLE.png",
    atlas_table = 'ANIMATION_ATLAS',
    frames = 21,
    fps = 10,
    px = 71,
    py = 95,
}


SMODS.Atlas {
    key = "c_eris_anim",
    path = "UNPLANETABLE/UNERISABLE.png",
    atlas_table = 'ANIMATION_ATLAS',
    frames = 21,
    fps = 10,
    px = 71,
    py = 95,
}



if not UNCARDABLE.config.disabled then
    for planet, data in pairs(G.UNCARDABLE_planets) do
        local randompos = math.random(0, data.variants - 1)
        SMODS["Consumable"]:take_ownership(planet, {
        atlas = planet .. "_anim",
        pos = {x = 0, y = 0 + randompos},
        artist_credits = {"guac"},
        --set_sprites = function(self, card, front)
        --    card.children.center:set_sprite_pos{x = 0, y = randompos}
        --    print("randompos chosen: ", randompos)
        --end
    }, true)
    end

end
