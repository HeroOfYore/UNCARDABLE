
    jokers = {
        j_8_ball = {pos = 0, artist = {'heroofyore'}},
        j_mr_bones = {pos = 1, artist = {'heroofyore'}},
        j_sixth_sense = {pos = 2, artist = {'heroofyore'}},
        j_stencil = {pos = 3, artist = {'heroofyore'}},
        j_wee = {pos = 4, artist = {'guac', 'heroofyore'}, {name = "j_wee"}},
        j_photograph = {pos = 5, artist = {'heroofyore'}},
        j_diet_cola = {pos = 6, artist = {'heroofyore'}},
        j_ice_cream = {pos = 7, artist = {'heroofyore'}},
        j_gros_michel = {pos = 8, artist = {'heroofyore'}},
        j_castle = {pos = 9, artist = {'heroofyore'}},
        j_cavendish = {pos = 10, artist = {'heroofyore'}},
        j_selzer = {pos = 11, artist = {'heroofyore'}},
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
        j_ring_master = {pos = 35, artist = {'ploutre'}},
        j_mime = {pos = 36, artist = {'heroofyore'}},
        j_even_steven = {pos = 37, artist = {'murdock'}},
        j_sock_and_buskin = {pos = 38, artist = {'8z'}},
        j_steel_joker = {pos = 39, artist={'stanza'}},
        j_to_the_moon = {pos = 40, artist={'birb'}},
        j_sly = {pos= 41, artist={'8z'}},
        j_greedy_joker = {pos = 42, artist = {'epicjeong'}},
        j_ticket = {pos = 43, artist={'heroofyore'}},
        j_bull = {pos = 44, artist = {'heroofyore'}},
        j_troubadour = {pos = 45, artist = {'epicjeong'}},
        j_dna = {pos = 46, artist = {'murdock'}},
    }



    SMODS.Atlas {
        key = "agglomeration",
        path = "AGGLOMERATION.png",
        px = 71, 
        py = 95
    }
    if not UNCARDABLE.config.disabled then
        for jkr, data in pairs(jokers) do
            SMODS["Joker"]:take_ownership(jkr, {atlas = "agglomeration",
            pos = {x = 0 + data.pos, y = 0},
            artist_credits = data.artist,
            soul_pos = {x = 0 + data.pos, y = 1},
            calculate = function(self, card, context)
                if data.name == "j_wee" then
                    loc_txt = {name = "I'm so tiny! I'm only 2kb!"} --- this isn't working, though i'm not sure why at the moment
                end
            end

        }, true)

        end
    end

    --[[ This section is for jokers with special properties e.g. popcorn and wee joker]]
    SMODS.Atlas {
        key = "multistage",
        path = "MULTISTAGE.png",
        px = 71,
        py = 95
    }
    if not UNCARDABLE.config.disabled then
        SMODS.Joker:take_ownership('j_wee', {
            loc_vars = function(self, info_queue, card)
                return {vars = {card.ability.extra.chips, card.ability.extra.chip_mod}}
            end
        }, true)

        SMODS.Joker:take_ownership("j_popcorn", {
            atlas = "multistage",
            pos = {x = 0, y = 0},
            artist_credits = {"8z"},
            config = {extra = {mult_loss = 4, mult = 20, cardpos = 0} },
            loc_vars = function(self, info_queue, card)
                return { vars = { card.ability.extra.mult, card.ability.extra.mult_loss } }
            end,
            calculate = function(self, card, context)
            if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                if card.ability.extra.mult - card.ability.extra.mult_loss <= 0 then
                    SMODS.destroy_cards(card, nil, nil, true)
                    return {
                        message = localize('msg_eaten'),
                        colour = G.C.RED
                    }
                else
                    card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_loss 
                    card.ability.extra.cardpos = card.ability.extra.cardpos + 1
                    return
                    {
                        message = localize{type = 'variable', key = 'a_mult_minus', vars = {card.ability.extra.mult_loss}},
                        colour = G.C.MULT, 
                        card.children.center:set_sprite_pos({x = card.ability.extra.cardpos, y = 0})
                    }
                end
            end
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end

        }, true)
    end

    --end of section


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
        j_brainstorm = {row = 16, artist = {'heroofyore'}},
        j_fibonacci = {row = 17, artist = {'heroofyore'}},
        j_jolly = {row = 18, artist = {'bramble'}},
        j_zany = {row = 19, artist = {'bramble'}},
        j_astronomer = {row = 20, artist = {'heroofyore'}},
        j_vampire = {row = 21, artist = {'ermywurm'}},
        j_throwback = {row = 22, artist = {'heroofyore'}},
    }
    animated_with_soul = {
        j_perkeo = {row = 0, artist = {'guac'}},
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
        SMODS.Atlas{
            key = "j_brainstorm_anim",
            path = "UNSCOOPABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 4,
            fps = 10,
            px = 71,
            py = 95
        }
        SMODS.Atlas{
            key = "j_fibonacci_anim",
            path = "UNSCOOPABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 63,
            fps = 10,
            px = 71,
            py = 95
        }

        SMODS.Atlas{
            key = "j_jolly_anim",
            path = "UNSCOOPABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 23,
            fps = 10,
            px = 71,
            py = 95
        }
        SMODS.Atlas{
            key = "j_zany_anim",
            path = "UNSCOOPABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 7,
            fps = 10,
            px = 71,
            py = 95
        }
        SMODS.Atlas{
            key = "j_astronomer_anim",
            path = "UNSCOOPABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 36,
            fps = 30,
            px = 71,
            py = 95
        }
        SMODS.Atlas{
            key = "j_vampire_anim",
            path = "UNSCOOPABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 77,
            fps = 10,
            px = 71,
            py = 95
        }
        SMODS.Atlas{
            key = "j_throwback_anim",
            path = "UNSCOOPABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 104,
            fps = 10,
            px = 71,
            py = 95
        }
    if not UNCARDABLE.config.disabled then
        for jkr, data in pairs(animated_jokers) do
            SMODS["Joker"]:take_ownership(jkr, {atlas = jkr .. "_anim",
            pos = {x = 0, y = 0 + data.row},
            artist_credits = data.artist,
            --soul_pos = {x = 0, y = 1}
        }, true)
        end
    end
        SMODS.Atlas{
            key = "j_perkeo_anim",
            path = "UNLEGENDABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 108,
            fps = 60,
            px = 71,
            py = 95
        }
    if not UNCARDABLE.config.disabled then
        for jkr, data in pairs(animated_with_soul) do
            SMODS["Joker"]:take_ownership(jkr, {atlas = jkr .. "_anim",
            pos = {x = 0, y = 0 + data.row},
            artist_credits = data.artist,
            soul_pos = {x = 0, y = 1 + data.row},
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
    SMODS.Sound({
        key = 'b_voice1',
        path = 'b_voice1.ogg',
        replace = 'voice1'
    })
    SMODS.Sound({
        key = 'b_voice2',
        path = 'b_voice2.ogg',
        replace = 'voice2'
    })
    SMODS.Sound({
        key = 'b_voice3',
        path = 'b_voice3.ogg',
        replace = 'voice3'
    })
    SMODS.Sound({
        key = 'b_voice4',
        path = 'b_voice4.ogg',
        replace = 'voice4'
    })    
    SMODS.Sound({
        key = 'b_voice5',
        path = 'b_voice5.ogg',
        replace = 'voice5'
    })
    SMODS.Sound({
        key = 'b_voice6',
        path = 'b_voice6.ogg',
        replace = 'voice6'
    })    
    SMODS.Sound({
        key = 'b_voice7',
        path = 'b_voice7.ogg',
        replace = 'voice7'
    })
    SMODS.Sound({
        key = 'b_voice8',
        path = 'b_voice8.ogg',
        replace = 'voice8'
    })    
    SMODS.Sound({
        key = 'b_voice9',
        path = 'b_voice9.ogg',
        replace = 'voice9'
    })
    SMODS.Sound({
        key = 'b_voice10',
        path = 'b_voice10.ogg',
        replace = 'voice10'
    })
    SMODS.Sound({
        key = 'b_voice11',
        path = 'b_voice11.ogg',
        replace = 'voice11'
    })
    if not UNCARDABLE.config.disabled then
        SMODS["Joker"]:take_ownership("j_ceremonial", {atlas = "SHOOTABLE",
        pos = {x = 0, y = 0},
        }, true)
    end

 