--- STEAMODDED HEADER
--- MOD_ID: BalatrUNBEATABLE_JKR
--- prefix: UNBEATJKR
--- MOD_AUTHOR: [HeroOfYore]
--- MOD_DESCRIPTION: Adds reskins of jokers. Very WIP.
--UNBALATROABLEJKR = SMODS.current_mod
---UNBALATROABLE_config_JKR = SMODS.current_mod.config
----UNBALATROABLE_config.gameset_toggle = true;    
    jokers = {
        j_8_ball = {pos = 0, artist = {'heroofyore'}},
        j_mr_bones = {pos = 1, artist = {'heroofyore'}},
        j_sixth_sense = {pos = 2, artist = {'heroofyore'}},
        j_stencil = {pos = 3, artist = {'heroofyore'}},
        j_wee = {pos = 4, artist = {'heroofyore'}},
        j_photograph = {pos = 5, artist = {'heroofyore'}},
        j_diet_cola = {pos = 6, artist = {'heroofyore'}},
        j_ice_cream = {pos = 7, artist = {'heroofyore'}},
        j_gros_michel = {pos = 8, artist = {'heroofyore'}},
        j_castle = {pos = 9, artist = {'heroofyore'}},
        j_cavendish = {pos = 10, artist = {'heroofyore'}},
        j_seltzer = {pos = 11, artist = {'heroofyore'}},
        j_hanging_chad = {pos = 12, artist = {'heroofyore'}},
        j_scary_face = {pos = 13, artist = {'heroofyore'}},
        j_acrobat = {pos = 14, artist = {'heroofyore'}},
        j_abstract = {pos = 15, artist = {'heroofyore'}},
        j_matador = {pos = 16, artist = {'ermywurm'}},
        j_ride_the_bus = {pos = 17, artist = {'heroofyore'}},
        j_blueprint = {pos = 18, artist = {'heroofyore'}},
        j_business = {pos = 19, artist = {'ermywurm'}},
        j_devious = {pos = 20, artist = {'ermywurm'}},
        j_luchador = {pos = 21, artist = {'heroofyore'}},
        j_swashbuckler = {pos = 22, artist = {'heroofyore'}},
        j_mail = {pos = 23, artist = {'ploutre'}},
        j_hologram = {pos = 24, artist= {'stanza'}},
        j_space = {pos = 25, artist = {'heroofyore'}},
        j_satellite = {pos = 26, artist = {'heroofyore'}},
        j_delayed_grat = {pos = 27, artist = {'ploutre'}},
        j_faceless = {pos = 28, artist = {'objitude'}},
        j_bootstraps = {pos = 29, artist = {'ploutre'}},
        j_vagabond = {pos = 30, artist = {'objitude'}},
        j_smiley = {pos = 31, artist = {'heroofyore'}},
        j_trousers = {pos = 32, artist = {'ploutre'}},
        j_cloud_9 = {pos = 33, artist = {'ploutre'}},
        j_joker = {pos = 34, artist = {'guac'}},
        j_showman = {pos = 35, artist = {'ploutre'}},
        j_mime = {pos = 36, artist = {'heroofyore'}},
        j_even_steven = {pos = 37, artist = {'murdock'}},
    }



    SMODS.Atlas {
        key = "agglomeration",
        path = "AGGLOMERATION.png",
        px = 71, 
        py = 95
    }
    if not UNBALATROABLE.config.disabled then
        for jkr, data in pairs(jokers) do
            SMODS["Joker"]:take_ownership(jkr, {atlas = "agglomeration",
            pos = {x = 0 + data.pos, y = 0},
            artist_credits = data.artist,
            soul_pos = {x = 0 + data.pos, y = 1}}, true)
        end
    end
    animated_jokers = {
        j_lucky_cat = {row = 0, artist = {'heroofyore'}},
        j_smeared = {row = 1, artist = {'heroofyore'}},
        j_baseball = {row = 2, artist = {'heroofyore'}},
        j_ramen = {row = 3, artist = {'heroofyore'}},
        j_flower_pot = {row = 4, artist = {'heroofyore'}},
        j_gift = {row = 5, artist = {'heroofyore'}},
        j_egg = {row = 6, artist = {'heroofyore'}},
        j_todo_list = {row = 7, artist = {'heroofyore'}},
        j_odd_todd = {row = 8, artist = {'heroofyore'}},
        j_burnt = {row = 9, artist = {'heroofyore'}},
        j_superposition = {row = 10, artist = {'ermywurm'}},
        j_bloodstone = {row = 11, artist = {'heroofyore'}},
        j_misprint = {row = 12, artist = {'heroofyore'}},
        j_constellation = {row = 13, artist = {'heroofyore'}},
        j_invisible = {row = 14, artist = {'heroofyore'}},
        j_madness = {row = 15, artist = {'heroofyore'}},
    }

    SMODS.Atlas {
        key = "j_lucky_cat_anim",
        path = "UNSCOOPABLE.png", 
        atlas_table = 'ANIMATION_ATLAS',
        frames = 3,
        px = 71, 
        py = 95,
    }

    SMODS.Atlas {
        key = "j_smeared_anim",
        path = "UNSCOOPABLE.png",
        atlas_table = 'ANIMATION_ATLAS',
        frames = 9,
        px = 71,
        py = 95,
    }

    SMODS.Atlas {
        key = "j_baseball_anim",
        path = "UNSCOOPABLE.png",
        atlas_table = 'ANIMATION_ATLAS',
        frames = 38,
        px = 71,
        py = 95,
    }

    SMODS.Atlas {
        key = "j_ramen_anim",
        path = "UNSCOOPABLE.png",
        atlas_table  = 'ANIMATION_ATLAS',
        frames = 7,
        fps = 5,
        px = 71,
        py = 95,
    }

    SMODS.Atlas {
        key = "j_flower_pot_anim",
        path = "UNSCOOPABLE.png",
        atlas_table  = 'ANIMATION_ATLAS',
        frames = 8,
        fps = 5,
        px = 71,
        py = 95,
    }

    SMODS.Atlas{
        key = "j_gift_anim",
        path = "UNSCOOPABLE.png",
        atlas_table  = 'ANIMATION_ATLAS',
        frames = 5,
        px = 71,
        py = 95,
    }

    SMODS.Atlas{
        key = "j_egg_anim",
        path = "UNSCOOPABLE.png",
        atlas_table  = 'ANIMATION_ATLAS',
        frames = 13,
        px = 71,
        py = 95,
    }

    SMODS.Atlas{
        key = "j_todo_list_anim",
        path = "UNSCOOPABLE.png",
        atlas_table  = 'ANIMATION_ATLAS',
        frames = 34,
        px = 71,
        py = 95,
    }
        SMODS.Atlas{
        key = "j_odd_todd_anim",
        path = "UNSCOOPABLE.png",
        atlas_table  = 'ANIMATION_ATLAS',
        frames = 4,
        fps = 3,
        px = 71,
        py = 95,
    }

        SMODS.Atlas{
        key = "j_burnt_anim",
        path = "UNSCOOPABLE.png",
        atlas_table  = 'ANIMATION_ATLAS',
        frames = 12,
        fps = 5,
        px = 71,
        py = 95,
    }
        SMODS.Atlas{
        key = "j_superposition_anim",
        path = "UNSCOOPABLE.png",
        atlas_table  = 'ANIMATION_ATLAS',
        frames = 40,
        fps = 14,
        px = 71,
        py = 95,
    }

        SMODS.Atlas{
        key = "j_bloodstone_anim",
        path = "UNSCOOPABLE.png",
        atlas_table  = 'ANIMATION_ATLAS',
        frames = 22,
        fps = 5,
        px = 71,
        py = 95,
    }
        SMODS.Atlas{
            key = "j_misprint_anim",
            path = "UNSCOOPABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 47,
            fps = 10,
            px = 71,
            py = 95
        }
        SMODS.Atlas{
            key = "j_constellation_anim",
            path = "UNSCOOPABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 27,
            fps = 10,
            px = 71,
            py = 95
        }
        SMODS.Atlas{
            key = "j_invisible_anim",
            path = "UNSCOOPABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 12,
            fps = 10,
            px = 71,
            py = 95
        }
        SMODS.Atlas{
            key = "j_madness_anim",
            path = "UNSCOOPABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 10,
            fps = 10,
            px = 71,
            py = 95
        }
    if not UNBALATROABLE.config.disabled then
        for jkr, data in pairs(animated_jokers) do
            SMODS["Joker"]:take_ownership(jkr, {atlas = jkr .. "_anim",
            pos = {x = 0, y = 0 + data.row},
            artist_credits = data.artist,
            --soul_pos = {x = 0, y = 1}
        }, true)
        end
    end

    SMODS.Atlas {
        key = "SHOOTABLE",
        path = "UNSHOOTABLE.png",
        px = 71,
        py = 95
    }
    SMODS.Sound({
        key = 'BANG',
        path = 'BANG.ogg',
        replace = 'slice1'
    })
    if not UNBALATROABLE.config.disabled then
        SMODS["Joker"]:take_ownership("j_ceremonial", {atlas = "SHOOTABLE",
        pos = {x = 0, y = 0},
        }, true)
    end