G.UNCARDABLE_planets = {
    c_mercury = {pos = 0, variants = 4, artist = {'guac'}, anim = "c_mercury"},
    c_venus = {pos = 1, variants = 2, artist = {'guac'}, anim = "c_venus"},
    c_earth = {pos = 2, variants = 1, artist = {'guac'}, anim = "c_earth"},
    c_mars = {pos = 3, variants = 2, artist = {'guac'}, anim = "c_mars"},
    c_jupiter = {pos = 4, variants = 1, artist = {'guac'}, anim = "c_jupiter"},
    c_saturn = {pos = 5, variants = 3, artist = {'guac'}, anim = "c_saturn"},
    c_uranus = {pos = 6, variants = 1, artist = {'guac'}, anim = "c_uranus"},
    c_neptune = {pos = 7, variants = 1, artist = {'guac'}, anim = "c_neptune"},
    c_pluto = {pos = 8, variants = 2, artist = {'guac'}, anim = "c_pluto"},
    c_planet_x = {pos = 9, variants = 3, artist = {'guac'}, anim = "c_planet_x"},
    c_ceres = {pos = 10, variants = 2, artist = {'guac'}, anim = "c_ceres"},
    c_eris = {pos = 11, variants = 1, artist = {'guac'}, anim = "c_eris"},
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
    if G.PROFILES[G.SETTINGS.profile].uncardable_planalternates == nil then
        G.PROFILES[G.SETTINGS.profile].uncardable_planalternates = {}
    end
    for planet, data in pairs(G.UNCARDABLE_planets) do
        if G.PROFILES[G.SETTINGS.profile].uncardable_planalternates[data.key] ~= nil then
            local pos = G.PROFILES[G.SETTINGS.profile].uncardable.uncardable_planalternates[data.key]
            SMODS["Consumable"]:take_ownership(planet, {
                atlas = planet.. "_anim",
                pos = {x = 0, y = pos},
                artist_credits = {"guac"},
            }, true)
        else
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

end


function UNCARDABLE.UNCARD_REINIT_PLANETS()
        if G.PROFILES[G.SETTINGS.profile].uncardable_planalternates == nil then
            G.PROFILES[G.SETTINGS.profile].uncardable_planalternates = {}
        end
    for planet, data in pairs(G.UNCARDABLE_planets) do
        --print(planet, " ", G.PROFILES[G.SETTINGS.profile].uncardable_planalternates[planets])
        if G.PROFILES[G.SETTINGS.profile].uncardable_planalternates[planet] ~= nil then
            local pos = G.PROFILES[G.SETTINGS.profile].uncardable_planalternates[planet]
            SMODS["Consumable"]:take_ownership(planet, {
                atlas = "uncardable_"..planet.. "_anim",
                pos = {x = 0, y = pos},
                unlocked = true,
                discovered = true,
                artist_credits = {"guac"},
            }, true)
        else
            local randompos = math.random(0, data.variants - 1)
            SMODS["Consumable"]:take_ownership(planet, {
            atlas = "uncardable_"..planet .. "_anim",
            pos = {x = 0, y = 0 + randompos},
            unlocked = true,
            discovered = true,
            artist_credits = {"guac"},
        }, true)
    end
    end
end