
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
        j_greedy_joker = {pos = 42, artist = {'epicelle'}},
        j_ticket = {pos = 43, artist={'heroofyore'}},
        j_bull = {pos = 44, artist = {'heroofyore'}},
        j_troubadour = {pos = 45, artist = {'epicelle'}},
        j_dna = {pos = 46, artist = {'murdock'}},
        j_cartomancer = {pos = 48, artist = {'objitude'}},
        j_glass = {pos = 49, artist = {'heroofyore'}},
        j_stuntman = {pos = 50, artist = {'fieldofgrass'}},
        j_four_fingers = {pos = 51, artist = {'ploutre'}},
        j_walkie_talkie = {pos = 52, artist ={'suvi'}},
        j_trading = {pos = 53, artist = {'heroofyore'}},
        j_flash = {pos = 54, artist = {'heroofyore'}},
        j_juggler = {pos = 55, artist = {'ploutre'}},
        j_seeing_double = {pos = 56, artist = {'ploutre'}},
        j_drunkard = {pos = 57, artist = {'ploutre'}},
        j_certificate = {pos = 58, artist = {'yuki'}},
        j_credit_card = {pos = 59, artist = {'ploutre'}},
        j_square = {pos = 60, artist = {'ploutre'}},
        j_shortcut = {pos = 61, artist = {'heroofyore'}},
        j_blackboard = {pos = 62, artist = {'grimp'}},
        
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
    SMODS.Atlas {
        key = "unrecordable",
        path = "UNRECORDABLE.png",
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

        SMODS.Joker:take_ownership("j_loyalty_card", {
            atlas = "unrecordable",
            pos = {x = 0, y = 0},
            artist_credits = {"heroofyore"},
            config = { extra = {Xmult = 4, every = 5, loyalty_remaining = 5} },
            loc_vars = function(self, info_queue, card)
                return {
                    vars = {
                        card.ability.extra.Xmult,
                        card.ability.extra.every + 1,
                        localize {type = 'variable', key = (card.ability.extra.loyalty_remaining == 0 and 'loyalty_active' or 'loyalty_inactive'), vars = {card.ability.extra.loyalty_remaining} }        
                    }
                }
            end,
            calculate = function(self, card, context)
                if context.joker_main then 
                    card.ability.extra.loyalty_remaining = (card.ability.extra.every - 1 - (G.GAME.hands_played - card.ability.hands_played_at_create)) %
                    (card.ability.extra.every + 1)
                    card.children.center:set_sprite_pos({x = 5 - card.ability.extra.loyalty_remaining, y = 0})
                    if not context.blueprint then
                        if card.ability.extra.loyalty_remaining == 0 then
                            local eval = function(card) return card.ability.extra.loyalty_remaining == 0 and not G.RESET_JIGGLES end
                            juice_card_until(card, eval, true)
                        end
                    end
                    if card.ability.extra.loyalty_remaining == card.ability.extra.every then
                        return {
                            xmult = card.ability.extra.Xmult
                        }
                    end
                end
            end

        }, true)
        SMODS.Joker:take_ownership("j_hologram", {
            soul_pos = {x = 24, y = 1, draw = function(card, size_mod, rotate_mod) 
                local rotate_mod = 0.1 * math.sin(1.219 * G.TIMERS.REAL) + 0.07 * math.sin((G.TIMERS.REAL) * math.pi * 5) * (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 2
                local size_mod = 1.25
            end}
        }, true)
    end


    ---SECTION FOR MULTICHOICE JOKERS
    SMODS.Atlas
    {
        key = "multichoice",
        path = "MULTICHOICE.png",
        px = 71,
        py = 95,
    }

    SMODS.Joker:take_ownership("j_hallucination", {
        atlas = "multichoice",
        pos = {x = 0, y = 0},
        artist_credits = {"heroofyore"},
        set_sprites = function(self, card, front)
            local randompos = math.random(0, 2)
            card.children.center:set_sprite_pos({x = randompos, y = 0})
        end
    }, true)



    --end of section


    animated_jokers = {
        j_lucky_cat = {row = 0, artist = {'heroofyore'}},
        j_gift = {row = 1, artist = {'heroofyore'}},
        j_odd_todd = {row = 2, artist = {'heroofyore'}},
        j_brainstorm = {row = 3, artist = {'heroofyore'}},
        j_campfire = {row = 4, artist = {'heroofyore'}},

        j_smeared = {row = 0, artist = {'heroofyore'}},
        j_ramen = {row = 1, artist = {'heroofyore'}},
        j_flower_pot = {row = 2, artist = {'heroofyore'}},
        j_madness = {row = 3, artist = {'heroofyore'}},
        j_zany = {row = 4, artist = {'$7bramble'}},

        j_egg = {row = 0, artist = {'heroofyore'}},
        j_burnt = {row = 1, artist = {'heroofyore'}},
        j_invisible = {row = 2, artist = {'heroofyore'}},

        j_bloodstone = {row = 0, artist = {'heroofyore'}},
        j_jolly = {row = 1, artist = {'$7bramble'}},

        j_constellation = {row = 0, artist = {'heroofyore'}},
        j_shoot_the_moon = {row = 1, artist = {'heroofyore'}},

        j_baseball = {row = 0, artist = {'heroofyore'}},
        j_superposition = {row = 1, artist = {'ermywurm'}},
        j_astronomer = {row = 2, artist = {'heroofyore'}},
        j_baron = {row = 3, artist = {'heroofyore'}},
        j_dusk = {row = 4, artist = {'heroofyore'}},

        j_misprint = {row = 0, artist = {'heroofyore'}},

        j_fibonacci = {row = 0, artist = {'heroofyore'}},

        j_vampire = {row = 0, artist = {'ermywurm'}},

        j_supernova = {row = 0, artist = {'heroofyore'}},

        j_throwback = {row = 0, artist = {'heroofyore'}},
        j_seance = {row = 1, artist = {'heroofyore'}},

        j_hit_the_road = {row = 0, artist = {'heroofyore'}},
        j_stone = {row = 0, artist = {'ploutre'}},

        j_reserved_parking = {row = 0, artist= {'heroofyore'}},

        j_droll = {row = 0, artist = {'$7bramble', 'heroofyore'}},
        j_onyx_agate = {row = 0, artist = {'heroofyore'}},

        j_rocket = {row = 0, artist = {'heroofyore'}},

        j_splash = {row = 0, artist = {'heroofyore'}},
        
        j_drivers_license = {row = 0, artist = {'heroofyore'}},
    
        j_duo = {row = 0, artist = {'heroofyore'}},
        j_trio = {row = 0, artist = {'heroofyore'}},
        j_family = {row = 0, artist = {'heroofyore'}},
        j_order = {row = 0, artist = {'heroofyore'}},
        j_tribe = {row = 0, artist = {'heroofyore'}},

        j_raised_fist = {row = 0, artist = {'heroofyore'}},

    }
    animated_with_soul = {
        j_perkeo = {row = 0, artist = {'guac'}},
    }

    --[[ animated_sub_5 = {
        j_lucky_cat = {row = 0, artist = {'heroofyore'}},
        j_gift = {row = 1, artist = {'heroofyore'}},
        j_odd_todd = {row = 2, artist = {'heroofyore'}},
        j_brainstorm = {row = 3, artist = {'heroofyore'}},
    }

    animated_sub_10 = {
        j_smeared = {row = 0, artist = {'heroofyore'}},
        j_ramen = {row = 1, artist = {'heroofyore'}},
        j_flower_pot = {row = 2, artist = {'heroofyore'}},
        j_madness = {row = 3, artist = {'heroofyore'}},
        j_zany = {row = 4, artist = {'bramble'}},

    }

    animated_sub_15 = {
        j_egg = {row = 0, artist = {'heroofyore'}},
        j_burnt = {row = 1, artist = {'heroofyore'}},
        j_invisible = {row = 2, artist = {'heroofyore'}},
    }
    animated_sub_25 = {
        j_bloodstone = {row = 0, artist = {'heroofyore'}},
        j_jolly = {row = 1, artist = {'bramble'}},
    }
    animated_sub_30 = {
        j_constellation = {row = 0, artist = {'heroofyore'}},
        j_shoot_the_moon = {row = 1, artist = {'heroofyore'}},
    }

    animated_sub_40 = {
        j_baseball = {row = 0, artist = {'heroofyore'}},
        j_superposition = {row = 1, artist = {'ermywurm'}},
        j_astronomer = {row = 2, artist = {'heroofyore'}},
        j_baron = {row = 3, artist = {'heroofyore'}},
        j_dusk = {row = 4, artist = {'heroofyore'}},
    }

    animated_sub_50 = {
        j_misprint = {row = 0, artist = {'heroofyore'}},
    }
    
    animated_sub_65 = {
        j_fibonacci = {row = 0, artist = {'heroofyore'}},
    }
    animated_sub_80 = {
        j_vampire = {row = 0, artist = {'ermywurm'}},
    }

    animated_sub_90 = {
        j_supernova = {row = 28, artist = {'heroofyore'}},
    }

    animated_plus_hundred = {
        j_throwback = {row = 0, artist = {'heroofyore'}},
        j_seance = {row = 1, artist = {'heroofyore'}},
    } ]] ---these are all for informational purposes

    
    SMODS.Atlas {
        key = "j_lucky_cat_anim",
        path = "UNFIVEABLE.png", 
        atlas_table = 'ANIMATION_ATLAS',
        frames = 3,
        px = 71, 
        py = 95,
    }

    SMODS.Atlas {
        key = "j_smeared_anim",
        path = "UNTENABLE.png",
        atlas_table = 'ANIMATION_ATLAS',
        frames = 9,
        px = 71,
        py = 95,
    }

    SMODS.Atlas {
        key = "j_baseball_anim",
        path = "UNFORTYABLE.png",
        atlas_table = 'ANIMATION_ATLAS',
        frames = 38,
        px = 71,
        py = 95,
    }

    SMODS.Atlas {
        key = "j_ramen_anim",
        path = "UNTENABLE.png",
        atlas_table  = 'ANIMATION_ATLAS',
        frames = 7,
        fps = 5,
        px = 71,
        py = 95,
    }

    SMODS.Atlas {
        key = "j_flower_pot_anim",
        path = "UNTENABLE.png",
        atlas_table  = 'ANIMATION_ATLAS',
        frames = 8,
        fps = 5,
        px = 71,
        py = 95,
    }

    SMODS.Atlas{
        key = "j_gift_anim",
        path = "UNFIVEABLE.png",
        atlas_table  = 'ANIMATION_ATLAS',
        frames = 5,
        px = 71,
        py = 95,
    }

    SMODS.Atlas{
        key = "j_egg_anim",
        path = "UNFIFTEENABLE.png",
        atlas_table  = 'ANIMATION_ATLAS',
        frames = 13,
        px = 71,
        py = 95,
    }

    SMODS.Atlas{
        key = "j_todo_list_anim",
        path = "UNFORTYABLE.png",
        atlas_table  = 'ANIMATION_ATLAS',
        frames = 34,
        px = 71,
        py = 95,
    }
        SMODS.Atlas{
        key = "j_odd_todd_anim",
        path = "UNFIVEABLE.png",
        atlas_table  = 'ANIMATION_ATLAS',
        frames = 4,
        fps = 3,
        px = 71,
        py = 95,
    }

        SMODS.Atlas{
        key = "j_burnt_anim",
        path = "UNFIFTEENABLE.png",
        atlas_table  = 'ANIMATION_ATLAS',
        frames = 12,
        fps = 5,
        px = 71,
        py = 95,
    }
        SMODS.Atlas{
        key = "j_superposition_anim",
        path = "UNFORTYABLE.png",
        atlas_table  = 'ANIMATION_ATLAS',
        frames = 40,
        fps = 14,
        px = 71,
        py = 95,
    }

        SMODS.Atlas{
        key = "j_bloodstone_anim",
        path = "UNTWENTYFIVEABLE.png",
        atlas_table  = 'ANIMATION_ATLAS',
        frames = 22,
        fps = 5,
        px = 71,
        py = 95,
    }
        SMODS.Atlas{
            key = "j_misprint_anim",
            path = "UNFIFTYABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 47,
            fps = 10,
            px = 71,
            py = 95
        }
        SMODS.Atlas{
            key = "j_constellation_anim",
            path = "UNTHIRTYABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 27,
            fps = 10,
            px = 71,
            py = 95
        }
        SMODS.Atlas{
            key = "j_invisible_anim",
            path = "UNFIFTEENABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 12,
            fps = 10,
            px = 71,
            py = 95
        }
        SMODS.Atlas{
            key = "j_madness_anim",
            path = "UNTENABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 10,
            fps = 10,
            px = 71,
            py = 95
        }
        SMODS.Atlas{
            key = "j_brainstorm_anim",
            path = "UNFIVEABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 4,
            fps = 10,
            px = 71,
            py = 95
        }
        SMODS.Atlas{
            key = "j_fibonacci_anim",
            path = "UNSIXTYFIVEABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 63,
            fps = 10,
            px = 71,
            py = 95
        }

        SMODS.Atlas{
            key = "j_jolly_anim",
            path = "UNTWENTYFIVEABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 23,
            fps = 10,
            px = 71,
            py = 95
        }
        SMODS.Atlas{
            key = "j_zany_anim",
            path = "UNTENABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 7,
            fps = 10,
            px = 71,
            py = 95
        }
        SMODS.Atlas{
            key = "j_astronomer_anim",
            path = "UNFORTYABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 36,
            fps = 30,
            px = 71,
            py = 95
        }
        SMODS.Atlas{
            key = "j_vampire_anim",
            path = "UNEIGHTYABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 77,
            fps = 10,
            px = 71,
            py = 95
        }
        SMODS.Atlas{
            key = "j_throwback_anim",
            path = "UNHUNDREDABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 104,
            fps = 10,
            px = 71,
            py = 95
        }
        SMODS.Atlas{
            key = "j_seance_anim",
            path = "UNHUNDREDABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 100,
            fps = 10,
            px = 71,
            py = 95
        }
            SMODS.Atlas{
            key = "j_campfire_anim",
            path = "UNFIVEABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 5,
            fps = 5,
            px = 71,
            py = 95
        }
            SMODS.Atlas {
            key = "j_shoot_the_moon_anim",
            path = "UNTHIRTYABLE.png",
            atlas_table = 'ANIMATION_ATLAS',
            frames = 28,
            fps = 10,
            px = 71,
            py = 95
        }
            SMODS.Atlas {
            key = "j_baron_anim",
            path = "UNFORTYABLE.png",
            atlas_table  = 'ANIMATION_ATLAS',
            frames = 34,
            fps = 5,
            px = 71,
            py = 95,
        }
        SMODS.Atlas {
        key = "j_dusk_anim",
        path = "UNFORTYABLE.png",
        atlas_table  = 'ANIMATION_ATLAS',
        frames = 40,
        fps = 5,
        px = 71,
        py = 95,
    }
        SMODS.Atlas {
        key = "j_supernova_anim",
        path = "UNNINETYABLE.png",
        atlas_table  = 'ANIMATION_ATLAS',
        frames = 89,
        fps = 10,
        px = 71,
        py = 95,
    }

    SMODS.Atlas {
        key = "j_hit_the_road_anim",
        path = "UNHITTABLE.png",
        atlas_table  = 'ANIMATION_ATLAS',
        frames = 6,
        fps = 10,
        px = 71,
        py = 95,
    }
    SMODS.Atlas {
        key = "j_stone_anim",
        path = "UNINTERROGATABLE.png",
        atlas_table = 'ANIMATION_ATLAS',
        frames = 20,
        fps = 5,
        px = 71,
        py = 95,
    }
        SMODS.Atlas {
        key = "j_reserved_parking_anim",
        path = "UNRESTABLE.png",
        atlas_table = 'ANIMATION_ATLAS',
        frames = 64,
        fps = 10,
        px = 71,
        py = 95,
    }
    SMODS.Atlas {
        key = "j_droll_anim",
        path = "UNPINKABLE.png",
        atlas_table = 'ANIMATION_ATLAS',
        frames = 13,
        fps = 10,
        px = 71,
        py = 95,
    }
    SMODS.Atlas {
        key = "j_onyx_agate_anim",
        path = "UNLIGHTABLE.png",
        atlas_table = 'ANIMATION_ATLAS',
        frames = 193,
        fps = 20,
        px = 71,
        py = 95,
    }
    SMODS.Atlas {
        key = "j_rocket_anim",
        path = "UNARRESTABLE.png",
        atlas_table = 'ANIMATION_ATLAS',
        frames = 8,
        fps = 10,
        px = 71,
        py = 95,
    }
    SMODS.Atlas {
        key = "j_splash_anim",
        path = "UNRAMENABLE.png",
        atlas_table = 'ANIMATION_ATLAS',
        frames = 38,
        fps = 10,
        px = 71,
        py = 95,
    }

    SMODS.Atlas {
        key = "j_drivers_license_anim",
        path = "UNTRILLABLE.png",
        atlas_table = 'ANIMATION_ATLAS',
        frames = 12,
        fps = 5,
        px = 71,
        py = 95,
    }

    SMODS.Atlas {
        key = "j_duo_anim",
        path = "UNTWINABLE.png",
        atlas_table = 'ANIMATION_ATLAS',
        frames = 32,
        fps = 10,
        px = 71,
        py = 95,
    }
    SMODS.Atlas {
        key = "j_trio_anim",
        path = "UNOMFABLE.png",
        atlas_table = 'ANIMATION_ATLAS',
        frames = 34,
        fps = 10,
        px = 71,
        py = 95,
    }
    SMODS.Atlas {
        key = "j_family_anim",
        path = "UNBANDABLE.png",
        atlas_table = 'ANIMATION_ATLAS',
        frames = 17,
        fps = 10,
        px = 71,
        py = 95,
    }
    SMODS.Atlas {
        key = "j_order_anim",
        path = "UNHARMABLE.png",
        atlas_table = 'ANIMATION_ATLAS',
        frames = 32,
        fps = 10,
        px = 71,
        py = 95,
    }
    SMODS.Atlas {
        key = "j_tribe_anim",
        path = "UNBEATABLE.png",
        atlas_table = 'ANIMATION_ATLAS',
        frames = 130,
        fps = 10,
        px = 71,
        py = 95,
    }
        SMODS.Atlas {
        key = "j_raised_fist_anim",
        path = "UNENDABLE.png",
        atlas_table = 'ANIMATION_ATLAS',
        frames = 130,
        fps = 20,
        px = 71,
        py = 95,
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

 