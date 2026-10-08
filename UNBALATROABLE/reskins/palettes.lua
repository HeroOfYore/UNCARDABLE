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
	Blind:change_colour(G.C.BLUE)
	--UNCARDABLE.uncardable_change_ui()
end

local blind_color = Blind.change_colour
function Blind:change_colour(blind_col)
        local ret = blind_color(self, blind_col)
        if UNCARDABLE.config.palette_num == 1
        then 
				ease_colour(G.C.RED, HEX("FE5F55"))
				ease_colour(G.C.XMULT, HEX("FE5F55"))
				ease_colour(G.C.IMPORTANT, HEX("ff9a00"))
				ease_colour(G.C.UI.TEXT_LIGHT, HEX("FFFFFF"))
				ease_colour(G.C.BLUE, HEX("009dff"))
				ease_colour(G.C.ORANGE, HEX("fda200"))
				
                return ret
        else
			if UNCARDABLE.config.palette_num == 2
			then
				ease_colour(G.C.DYN_UI.MAIN, HEX("FF4B7D"))
				ease_colour(G.C.IMPORTANT, HEX("FF4B7D"))
				ease_colour(G.C.BLUE, HEX("FF4B7D"))
				ease_colour(G.C.ORANGE, HEX("FF4B7D"))
				ease_colour(G.C.BLACK, HEX("FF487D"))

				ease_colour(G.C.DYN_UI.DARK, HEX("000000"))
				ease_colour(G.C.RED, HEX("000000"))
				ease_colour(G.C.XMULT, HEX("000000"))

				ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("E1DFBF"))

				ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("F9F7D5"))
				
				ease_colour(G.C.UI.TEXT_LIGHT, HEX("B4B399"))
			elseif UNCARDABLE.config.palette_num == 3
			then
				ease_colour(G.C.DYN_UI.MAIN, HEX("00b381"))
				ease_colour(G.C.IMPORTANT, HEX("00b381"))
				ease_colour(G.C.BLUE, HEX("00b381"))
				ease_colour(G.C.ORANGE, HEX("00b381"))
				ease_colour(G.C.BLACK, HEX("00b381"))

				ease_colour(G.C.DYN_UI.DARK, HEX("FFFFFF"))
				ease_colour(G.C.RED, HEX("FFFFFF"))
				ease_colour(G.C.XMULT, HEX("FFFFFF"))

				ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("1e203f"))
				
				ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("06082a"))
				
				ease_colour(G.C.UI.TEXT_LIGHT, HEX("4b4c66"))
            elseif UNCARDABLE.config.palette_num == 4
			then
				ease_colour(G.C.DYN_UI.MAIN, HEX("f78536"))
				ease_colour(G.C.IMPORTANT, HEX("f78536"))
				ease_colour(G.C.BLUE, HEX("f78536"))
				ease_colour(G.C.ORANGE, HEX("f78536"))
				ease_colour(G.C.BLACK, HEX("f78536"))

				ease_colour(G.C.DYN_UI.DARK, HEX("503f3a"))
				ease_colour(G.C.RED, HEX("503f3a"))
				ease_colour(G.C.XMULT, HEX("503f3a"))

				ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("fec100"))
				
				ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("feeab9"))
				
				--ease_colour(G.C.UI.TEXT_LIGHT, HEX("72615d"))
			elseif UNCARDABLE.config.palette_num == 5
			then
				ease_colour(G.C.DYN_UI.MAIN, HEX("70d9ff")) --border and behind Small Blind text
				ease_colour(G.C.DYN_UI.DARK, HEX("4fdab6")) -- behind the blind chip
				ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("efefef"))
				ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("318bcf"))
				ease_colour(G.C.RED, HEX("4fdab6"))
				--ease_colour(G.C.XMULT, HEX("4fdab6"))
				ease_colour(G.C.IMPORTANT, HEX("70d9ff"))
				ease_colour(G.C.UI.TEXT_LIGHT, HEX("ff97b0"))
				ease_colour(G.C.BLUE, HEX("70d9ff"))
				ease_colour(G.C.ORANGE, HEX("70d9ff"))
				--ease_colour(G.C.DYN_UI.BOSS_PALE, HEX("ff97b0")) -- possibly also the Sort Hand outsides?
				--G.C.UI.TEXT_DARK = HEX("ff97b0") -- i have literally no idea
				--G.C.UI.TEXT_INACTIVE = HEX("ff97b0") --sets the colours for the "Play Hand" and "Discard" when not in use
				--G.C.WHITE = HEX("ff97b0") -- does change everything. but also tints the entire god damn screen.
			end
        
        end
end


local blind_text_col = Game.start_run
function Game:start_run(args)
	if UNCARDABLE.config.palette_num == 2
	then
		G.C.WHITE = HEX("B4B399")
	elseif UNCARDABLE.config.palette_num == 3
	then
		G.C.WHITE = HEX("4b4c66")
	elseif UNCARDABLE.config.palette_num == 4
	then
		G.C.WHITE = HEX("72615d")
	elseif UNCARDABLE.config.palette_num == 5
	then
		G.C.WHITE = HEX("ff97b0")
		--G.C.RED = HEX("4fdab6")
	end
	local ret = blind_text_col(self, args)
	G.C.WHITE = {1, 1, 1, 1}
end  --yy

local update_col = Game.update
function Game:update(dt)
	if UNCARDABLE.config.palette_num == 2
	then
		G.C.WHITE = HEX("B4B399")
	elseif UNCARDABLE.config.palette_num == 3
	then
		G.C.WHITE = HEX("4b4c66")
	elseif UNCARDABLE.config.palette_num == 4
	then
		G.C.WHITE = HEX("72615d")
	elseif UNCARDABLE.config.palette_num == 5
	then
		G.C.WHITE = HEX("ff97b0")
		--G.C.RED = HEX("4fdab6")
	end
	local ret = update_col(self, dt)
	G.C.WHITE = {1, 1, 1, 1}
end




