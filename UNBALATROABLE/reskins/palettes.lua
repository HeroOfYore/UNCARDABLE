--[[function UNCARDABLE.uncardable_change_ui()
	if UNCARDABLE.config.palette_num == 2
	then
		SMODS.current_mod.ui_config = 
		{
			colour = HEX("35B4E4"),
			back_colour = HEX("F6F6F6"),
		}
	end
	if UNCARDABLE.config.palette_num == 3
	then
		SMODS.current_mod.ui_config = 
		{
			colour = HEX("70d9ff"),
			back_colour = HEX("318bcf"),

		}
	end
end]]

SMODS.current_mod.extra_tabs = function()

    return {
                {
                    label = 'Test Palette page',
                    tab_definition_function = function()
                    return {n = G.UIT.ROOT, config = {
                            emboss = 0.05,
			    			minh = 6,
			    			r = 0.1,
			    			minw = 10,
			    			align = "cm",
			    			padding = 0.2,
			    			colour = G.C.BLACK,
                        }, 
                        nodes = {
							create_option_cycle({
								options = localize('uncard_palettes'),
								scale = 0.7,
								w = 4.5,
								current_option = UNCARDABLE.config.palette_num,
								opt_callback = "uncardable_change_palette",
								ref_table = UNCARDABLE.config,
								ref_value = "palette_num"
							})
                        }}
                end,
                },
        }
end

G.FUNCS.uncardable_change_palette = function(color)
	UNCARDABLE.config.palette_num = color.to_key
	--UNCARDABLE.uncardable_change_ui()
end

local blind_color = Blind.change_colour
function Blind:change_colour(blind_col)
        local ret = blind_color(self, blind_col)
        if UNCARDABLE.config.palette_num == 1
        then 
                return ret
        else
			if UNCARDABLE.config.palette_num == 2
			then
				ease_colour(G.C.DYN_UI.MAIN, HEX("35B4E4")) --border and behind Small Blind text
       		 	ease_colour(G.C.DYN_UI.DARK, HEX("35B4E4")) -- outside of where it says the score required and the blind chip.
       		 	ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("F7889E")) -- behind text, around hands and discards
       		 	ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("F6F6F6")) -- BACKGROUND OF UI.
            elseif UNCARDABLE.config.palette_num == 3
			then
				ease_colour(G.C.DYN_UI.MAIN, HEX("ff388e"))
				ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("FFFFFF"))
			elseif UNCARDABLE.config.palette_num == 4
			then
				ease_colour(G.C.DYN_UI.MAIN, HEX("70d9ff"))
				ease_colour(G.C.DYN_UI.DARK, HEX("4fdab6"))
				ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("efefef"))
				ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("318bcf"))
				--G.C.UI.TEXT_DARK = HEX("ff97b0") -- i have literally no idea
				--G.C.UI.TEXT_INACTIVE = HEX("ff97b0") --sets the colours for the "Play Hand" and "Discard" when not in use
				--G.C.WHITE = HEX("ff97b0") -- does change everything. but also tints the entire god damn screen.
			end
        
        end
end


local blind_text_col = Blind.set_blind
function Blind:set_blind(blind, reset, silent)
	if UNCARDABLE.config.palette_num == 4
	then
		G.C.WHITE = HEX("ff97b0")
	end
	local ret = blind_text_col(self, blind, reset, silent)
	G.C.WHITE = {1, 1, 1, 1}
end




