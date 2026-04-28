

--if not UNBALATROABLE then
--    UNBALATROABLE = {}
--end
--local mod_path = "" .. SMODS.current_mod.path
--UNBALATROABLE.path = mod_path
--UNBALATROABLE_config = SMODS.current_mod.config
UNCARDABLE = SMODS.current_mod
maloaded = false

if next(SMODS.find_mod("malverk")) then
    maloaded = true
    print("MALVERK DETECTED")
    assert(SMODS.load_file('reskins/malcompat.lua'))()
end
--assert(SMODS.load_file("config.lua"))()
----UNBALATROABLE_config.gameset_toggle = true;
assert(SMODS.load_file('reskins/functions.lua'))()
if not maloaded then
    assert(SMODS.load_file('reskins/UNCARDABLE_JKR.lua'))()
end
assert(SMODS.load_file('reskins/artistui.lua'))()
assert(SMODS.load_file('reskins/quipadds.lua'))()
assert(SMODS.load_file('reskins/UNCARDABLE_OTHER.lua'))()
-----------------------------
----------------------------



ranks = {"Jack", "Queen", "King"}

SMODS.Atlas {
    key = 'balatro',
    path = 'uncardalogo.png',
    px = 333,
    py = 216,
    prefix_config = {key = false}
}
SMODS.Atlas {
    key = 'unbeataspades',
    px = 71,
    py = 95,
    disable_mipmap = true;
    path = 'UNBEATASPADESLC.png'
}

SMODS.Atlas {
    key = 'unbeataspades_hc',
    px = 71,
    py = 95,
    disable_mipmap = true;
    path = 'UNBEATASPADESHC.png'
}

SMODS.Atlas {
    key = 'unbeatahearts',
    px = 71,
    py = 95,
    disable_mipmap = true;
    path = 'UNBEATAHEARTSLC.png'
}
SMODS.Atlas {
    key = 'unbeatahearts_hc',
    px = 71,
    py = 95,
    disable_mipmap = true;
    path = 'UNBEATAHEARTSHC.png'
}

SMODS.Atlas {
    key = 'unbeataclubs',
    px = 71,
    py = 95,
    disable_mipmap = true;
    path = 'UNBEATACLUBSLC.png'
}
SMODS.Atlas {
    key = 'unbeataclubs_hc',
    px = 71,
    py = 95,
    disable_mipmap = true;
    path = 'UNBEATACLUBSHC.png'
}

SMODS.Atlas {
    key = 'unbeatadiamonds',
    px = 71,
    py = 95,
    disable_mipmap = true;
    path = 'UNBEATADIAMONDSLC.png'
}
SMODS.Atlas {
    key = 'unbeatadiamonds_hc',
    px = 71,
    py = 95,
    disable_mipmap = true;
    path = 'UNBEATADIAMONDSHC.png'
}

SMODS.DeckSkin ({
    key = 'UnbeataSpades',
    suit = "Spades",
    ranks = ranks,
    lc_atlas = 'unbeataspades',
    hc_atlas = 'unbeataspades_hc',
    loc_txt = {
        ['en-us'] = 'UNBEATABLE'
    },
    pos_style = 'collab'
})

SMODS.DeckSkin({
    key = 'UnbeataHearts',
    suit = "Hearts",
    ranks = ranks,
    lc_atlas = 'unbeatahearts',
    hc_atlas = 'unbeatahearts_hc',
    loc_txt = {
        ['en-us'] = 'UNBEATABLE',
    },
    pos_style = 'collab'
})

SMODS.DeckSkin({
    key = 'UnbeataClubs',
    suit = "Clubs",
    ranks = ranks,
    lc_atlas = 'unbeataclubs',
    hc_atlas = 'unbeataclubs_hc',
    loc_txt = {
        ['en-us'] = 'UNBEATABLE',
    },
    pos_style = 'collab'
})

SMODS.DeckSkin({
    key = 'UnbeataDiamonds',
    suit = "Diamonds",
    ranks = ranks,
    lc_atlas = 'unbeatadiamonds',
    hc_atlas = 'unbeatadiamonds_hc',
    loc_txt = {
        ['en-us'] = 'UNBEATABLE',
    },
    pos_style = 'collab'
})
-----------------------------
-----------------------------

SMODS.Sound({
    vol = 1.0,
    pitch = 1,
    key = "music_uncardable",
    path = "music_uncardable_v4.ogg",
    select_music_track = function()
        return G.GAME
        and 1
    end,
    --[[sync = {
        music_uncardable_shop = true,
        music_uncardable_tarot = true,
        music_uncardable_planet = true,
        music_uncardable_shop = true,
    }]]
})

SMODS.Sound({
    vol = 1.0,
    pitch = 1,
    key = "music_uncardable_shop",
    path = "music_uncardable_shop.ogg",
    select_music_track = function()
        return G.GAME
        and (G.GAME and G.shop)
        and 50
    end,
    --[[sync = {
        music_uncardable = true,
        music_uncardable_tarot = true,
        music_uncardable_planet = true,
        music_uncardable_boss = true,
    }]]
})

SMODS.Sound({
    vol = 1.0,
    pitch = 1,
    key = "music_uncardable_tarot",
    path = "music_uncardable_tarot.ogg",
    select_music_track = function()
		return G.GAME
        and (G.booster_pack)
        and 100
    end,
    --[[sync = {
        music_uncardable = true,
        music_uncardable_boss = true,
        music_uncardable_planet = true,
        music_uncardable_shop = true,
    }]]
})

SMODS.Sound({
    vol = 1.0,
    pitch = 1,
    key = "music_uncardable_planet",
    path = "music_uncardable_planet.ogg",
    select_music_track = function()
		return G.GAME
        and (G.STATE and (G.STATE == G.STATES.SPECTRAL_PACK or G.booster_pack_meteors))
        and 200
    end,
    --[[sync = {
        music_uncardable = true,
        music_uncardable_tarot = true,
        music_uncardable_boss = true,
        music_uncardable_shop = true,
    }]]
})

SMODS.Sound({
    vol = 1.0,
    pitch = 1,
    key = "music_uncardable_boss",
    path = "music_uncardable_boss.ogg",
    select_music_track = function()
        return G.GAME
        and (G.GAME and G.GAME.blind and G.GAME.blind.boss)
        and 200
    end,
    --[[sync = {
        music_uncardable = true,
        music_uncardable_tarot = true,
        music_uncardable_planet = true,
        music_uncardable_shop = true,
    }]]
})

local UNCARDABLEConfigTab = function()
    unbal_nodes = {
        {
            n = G.UIT.R,
			config = { align = "cm" },
			nodes = {
				{
					n = G.UIT.O,
					config = {
						object = DynaText({
							string = "This toggle disables reskinned jokers.",
							colours = { G.C.WHITE },
							shadow = true,
							scale = 0.4,
						}),
					},
				},
			},
        }
    }
    left_settings = { n = G.UIT.C, config = { align = "tl", padding = 0.05 }, nodes = {} }
	right_settings = { n = G.UIT.C, config = { align = "tl", padding = 0.05 }, nodes = {} }
	config = { n = G.UIT.R, config = { align = "tm", padding = 0 }, nodes = { left_settings, right_settings } }
	unbal_nodes[#unbal_nodes + 1] = config
    unbal_nodes[#unbal_nodes + 1] = UIBox_button({
        colour = G.C.yore,
        button = "total_reskins",
        label = {localize("uncard_skins")},
        minw = 5.0,
        minh = 1.7,
        scale = 0.7, 
        id = "reskinned_jokers"
    })
    unbal_nodes[#unbal_nodes + 1] = create_toggle({
        label = "Disable Reskinned Jokers (requires restart to activate)",
        active_colour = HEX("E01BDE"),
        ref_table = UNCARDABLE.config,
        ref_value = "disabled",
    })
    unbal_nodes[#unbal_nodes + 1] = create_toggle({
        label = "Enable chipispis mode. Probably requires restart",
        active_colour = HEX("E01BDE"),
        ref_table = UNCARDABLE.config,
        ref_value = "chipispis",
    })
    unbal_nodes[#unbal_nodes + 1] = create_toggle({
        label = "Enable random chipispis. Requires chipispis mode on.",
        active_colour = HEX("E01BDE"),
        ref_table = UNCARDABLE.config,
        ref_value ="chipnumsis",
    })
    return {
		n = G.UIT.ROOT,
		config = {
			emboss = 0.05,
			minh = 6,
			r = 0.1,
			minw = 10,
			align = "cm",
			padding = 0.2,
			colour = G.C.BLACK,
		},
		nodes = unbal_nodes,
	}
end

SMODS.current_mod.config_tab = UNCARDABLEConfigTab

G.FUNCS.close_initial_config = function()
    SMODS.save_mod_config(UNCARDABLE)
end




local game_main_menu_ref = Game.main_menu
function Game:main_menu(change_context)
    local ret = game_main_menu_ref(self, change_context)
    G.SPLASH_BACK:define_draw_steps({
        {
            shader = "splash",
            send = {
                { name = "time", ref_table = G.TIMERS, ref_value = "REAL_SHADER"},
                { name = "vort_speed", val = 0.4 },
                { name = "colour_1", ref_table = G.C, ref_value = "splashpink"},
                {name = "colour_2", ref_table = G.C, ref_value = "splashblue"},
            },
        },
    })
    return ret
end