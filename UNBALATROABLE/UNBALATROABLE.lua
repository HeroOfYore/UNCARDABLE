--- STEAMODDED HEADER
--- MOD_AUTHOR: [HeroOfYore]
--- MOD_DESCRIPTION: Adds UNBEATABLE reskins of J, Q, K of all suits

--if not UNBALATROABLE then
--    UNBALATROABLE = {}
--end
--local mod_path = "" .. SMODS.current_mod.path
--UNBALATROABLE.path = mod_path
--UNBALATROABLE_config = SMODS.current_mod.config
UNBALATROABLE = SMODS.current_mod
--assert(SMODS.load_file("config.lua"))()
----UNBALATROABLE_config.gameset_toggle = true;
assert(SMODS.load_file('reskins/UNBALATROABLE_JKR.lua'))()
assert(SMODS.load_file('reskins/artistui.lua'))()
-----------------------------
----------------------------

ranks = {"Jack", "Queen", "King"}

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




local UNBALATROABLEConfigTab = function()
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
    unbal_nodes[#unbal_nodes + 1] = create_toggle({
        label = "Disable Reskinned Jokers (requires restart to activate)",
        active_colour = HEX("E01BDE"),
        ref_table = UNBALATROABLE.config,
        ref_value = "disabled",
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

SMODS.current_mod.config_tab = UNBALATROABLEConfigTab

G.FUNCS.close_initial_config = function()
    SMODS.save_mod_config(UNBALATROABLE)
end