G.UNCARDABLE_SPECTRALS = {
    c_familiar = {artist = {"heroofyore"}, anim = "c_familiar_anim"},
    c_grim = {artist = {'heroofyore'}, anim = "c_grim_anim"},
    c_incantation = {artist = {'heroofyore'}, anim = "c_incantation_anim"},
    c_talisman = {artist = {'heroofyore'}, anim = "c_talisman_anim"},
    c_aura = {artist = {'heroofyore'}, anim = "c_aura_anim"},
    c_wraith = {artist = {'heroofyore'}, anim = "c_wraith_anim"},
    c_sigil = {artist = {'heroofyore'}, anim = "c_sigil_anim"},
    c_ouija = {artist = {'heroofyore'}, anim = "c_ouija_anim"},
    c_ectoplasm = {artist = {'heroofyore'}, anim = "c_ectoplasm_anim"},
    c_immolate = {artist = {'heroofyore'}, anim = "c_immolate_anim"},
    c_ankh = {artist = {'heroofyore'}, anim = "c_ankh_anim"},
    c_deja_vu = {artist = {'heroofyore'}, anim = "c_deja_vu_anim"},
    c_trance = {artist = {'heroofyore'}, anim = "c_trance_anim"},
    c_medium = {artist = {'heroofyore'}, anim = "c_medium_anim"},
    c_cryptid = {artist = {'heroofyore'}, anim = "c_cryptid_anim"},

}


SMODS.Atlas {
    key = "c_familiar_anim",
    path = "UNSPECTRABLE/UNFAMILIABLE.png",
    atlas_table = "ANIMATION_ATLAS",
    frames = 16,
    fps = 5,
    px = 71,
    py = 95, 
}

SMODS.Atlas {
    key = "c_grim_anim",
    path = "UNSPECTRABLE/UNGAZEABLE.png",
    atlas_table = "ANIMATION_ATLAS",
    frames = 10,
    fps = 10,
    px = 71,
    py = 95, 
}

SMODS.Atlas {
    key = "c_incantation_anim",
    path = "UNSPECTRABLE/UNINCANTABLE.png",
    atlas_table = "ANIMATION_ATLAS",
    frames = 81,
    fps = 10,
    px = 71,
    py = 95, 
}

SMODS.Atlas {
    key = "c_talisman_anim",
    path = "UNSPECTRABLE/UNPOSEABLE.png",
    atlas_table = "ANIMATION_ATLAS",
    frames = 23,
    fps = 10,
    px = 71,
    py = 95, 
}

SMODS.Atlas {
    key = "c_aura_anim",
    path = "UNSPECTRABLE/UNTETOABLE.png",
    atlas_table = "ANIMATION_ATLAS",
    frames = 16,
    fps = 10,
    px = 71,
    py = 95, 
}

SMODS.Atlas {
    key = "c_wraith_anim",
    path = "UNSPECTRABLE/UNSPIREABLE.png",
    atlas_table = "ANIMATION_ATLAS",
    frames = 19,
    fps = 10,
    px = 71,
    py = 95, 
}

SMODS.Atlas {
    key = "c_sigil_anim",
    path = "UNSPECTRABLE/UNSIGILABLE.png",
    atlas_table = "ANIMATION_ATLAS",
    frames = 38,
    fps = 10,
    px = 71,
    py = 95, 
}

SMODS.Atlas {
    key = "c_ouija_anim",
    path = "UNSPECTRABLE/UNPERFORMABLE.png",
    atlas_table = "ANIMATION_ATLAS",
    frames = 53,
    fps = 10,
    px = 71,
    py = 95, 
}

SMODS.Atlas {
    key = "c_ectoplasm_anim",
    path = "UNSPECTRABLE/UNVHSABLE.png",
    atlas_table = "ANIMATION_ATLAS",
    frames = 69,
    fps = 10,
    px = 71,
    py = 95, 
}

SMODS.Atlas {
    key = "c_immolate_anim",
    path = "UNSPECTRABLE/UNIMMOLATABLE.png",
    atlas_table = "ANIMATION_ATLAS",
    frames = 12,
    fps = 10,
    px = 71,
    py = 95, 
}

SMODS.Atlas {
    key = "c_ankh_anim",
    path = "UNSPECTRABLE/UNBOWABLE.png",
    atlas_table = "ANIMATION_ATLAS",
    frames = 52,
    fps = 10,
    px = 71,
    py = 95, 
}

SMODS.Atlas {
    key = "c_deja_vu_anim",
    path = "UNSPECTRABLE/UNJUXTABLE.png",
    atlas_table = "ANIMATION_ATLAS",
    frames = 49,
    fps = 10,
    px = 71,
    py = 95, 
}

SMODS.Atlas {
    key = "c_trance_anim",
    path = "UNSPECTRABLE/UNTAKEABLE.png",
    atlas_table = "ANIMATION_ATLAS",
    frames = 28,
    fps = 10,
    px = 71,
    py = 95, 
}

SMODS.Atlas {
    key = "c_medium_anim",
    path = "UNSPECTRABLE/UNDELETABLE.png",
    atlas_table = "ANIMATION_ATLAS",
    frames = 80,
    fps = 10,
    px = 71,
    py = 95, 
}

SMODS.Atlas {
    key = "c_cryptid_anim_1",
    path = "UNSPECTRABLE/UNSHOREABLE.png",
    atlas_table = "ANIMATION_ATLAS",
    frames = 24,
    fps = 10,
    px = 71,
    py = 95, 
}

SMODS.Atlas {
    key = "c_cryptid_anim_2",
    path = "UNSPECTRABLE/UNSHOREABLE_PLUSCREST.png",
    atlas_table = "ANIMATION_ATLAS",
    frames = 24,
    fps = 10,
    px = 71,
    py = 95, 
}

SMODS.Atlas {
    key = "c_cryptid_anim_3",
    path = "UNSPECTRABLE/UNSHOREABLE_POCO.png",
    atlas_table = "ANIMATION_ATLAS",
    frames = 24,
    fps = 10,
    px = 71,
    py = 95, 
}


if not UNCARDABLE.config.disabled then
    for spectral, data in pairs(G.UNCARDABLE_SPECTRALS) do
        if spectral == "c_cryptid" then
            local randompos = math.random(1, 3)
            SMODS["Consumable"]:take_ownership(spectral, {
                atlas = spectral .. "_anim_" .. randompos,
                pos = {x = 0, y = 0},
                artist_credits = data.artist,
            }, true)
        else
            SMODS["Consumable"]:take_ownership(spectral, {
                atlas = spectral .. "_anim",
                pos = {x = 0, y = 0},
                artist_credits = data.artist,
            }, true)
        end
    end
end
            

