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

--- The palettes code was all beautifully reformatted by YEETPRO420, brinding the code for setting the colours down from 1000 lines to 250
pal = {
	{ "FF4B7D", "000000", "e1dfbf", "F9F7d5", "B4B399" },
	{ "00b381", "FFFFFF", "1e203f", "06082a", "4b4c66" },
	{ "f78536", "503f3a", "fec100", "feeab9", "72615d" },
	{ "222222", "575757", "c7c7c7", "fefefe", "FFFFFF" },
	{ "5c7f5f", "5d8060", "83ad7d", "b1bb7f", "66976c" },
	{ "4b6fff", "ff8c4c", "ededed", "ffffff", "bfbfbf" },
	{ "ff98b1", "ffaf00", "ffcbd5", "ffffff", "fe6382" },
	{ "71daff", "50dbb6", "efefef", "318cd0", "ff97b0" },
	{ "016950", "0032ff", "000000", "adaaa5", "007763" },
	{ "e1e6e8", "8c2a2f", "ff9d71", "ff0050", "443c3c" },
	{ "eea642", "e6eaed", "cdbebe", "356e8d", "201a18" },
	{ "7552be", "fe4a74", "ededed", "f9d33b", "636c7b" },
	{ "01c1ff", "000000", "000000", "ffffff", "bfbfbf" },
	{ "fafafa", "9cfc85", "ff505c", "000000", "3b80e7" },
	{ "ffffff", "000000", "000000", "ff0026", "ffffff" },
	{ "fffde1", "000000", "e97478", "39e3b9", "fffde1" },
	{ "ff6e6e", "7774d3", "ffd454", "ededed", "e16374" },
	{ "e26474", "000000", "4a93e9", "595a70", "fefefe" },
	{ "cdf5b7", "e4a883", "4f5969", "4a93e9", "ececec" },
	{ "fe004f", "86d9aa", "ff9d71", "e1e6e8", "443c3c" },
	{ "25c51d", "748cff", "f01451", "020015", "316be9" },
	{ "cdf5b7", "364150", "4d5d71", "252e39", "4a92e9" },
	{ "f7889d", "3c3c3c", "35b4e5", "f7f7f7", "eb7d92" },
	{ "ffffff", "e2d8ff", "6127ff", "ff388e", "2d0013" },
	{ "d4d6e7", "232966", "54a6e3", "e25e57", "fcca68" },
	{ "e2455c", "4d435f", "4d435f", "d8ab8b", "61494d" },
	{ "e3851c", "593640", "949813", "565a87", "b18d78" },
	{ "742c7e", "e9bf36", "1d63a2", "020202", "dadde5" },
	{ "e75155", "ffd4b3", "8bebb1", "312f95", "b9db58" },
	{ "2de5fe", "fff400", "f13762", "000000", "ffffff" },
	{ "ff1e08", "1097f7", "ffb410", "ffebba", "013871" },
	{ "e664bb", "c069b6", "ffaff0", "ffcdf2", "e880d0" },
	{ "f8a219", "f6f2e8", "3f4f5e", "2e3a46", "4f6377" },
	{ "b4b4b4", "5c84a6", "be9d45", "372f80", "5f5f5f" },
	{ "fe0c69", "ffffff", "001838", "09001f", "ededed" },
	{ "9f5eba", "671b61", "ff9e71", "290050", "dee5e6" },
	{ "ff178b", "000000", "8effb8", "fffe52", "2c60c3" },
	{ "ffbbde", "1c163c", "db7dda", "493a7d", "fff0dc" },
	{ "ff7774", "b21b54", "f09837", "f5c9a3", "cf2c57" },
	{ "a18b60", "0a1c36", "48638b", "e0dcd5", "614d23" },
	{ "421d25", "fee03d", "5d43fa", "c04b67", "6e2b37" },
	{ "141414", "9b6fff", "3c3c3c", "ffffff", "5292f3" },
	{ "068a1f", "f6f6f6", "00f700", "8ac64d", "113113" },
	{ "fe3268", "fe953f", "b9d3de", "ededed", "9f9f9f" },
	{ "3d445f", "e3e8e8", "676e90", "87a1c5", "565a5e" },
	{ "a3a39c", "6f8cf6", "3f3e45", "6a5960", "c1c0c6" },
	{ "b19494", "e2e6e8", "ffdf01", "2f2f2f", "d87342" },
	{ "2f2f2f", "fef100", "6a5961", "b29595", "e2e6e8" },
	{ "eb3232", "ffcd33", "fecd32", "f5ebeb", "000000" },
	{ "15cece", "0132cc", "0031cc", "0a1414", "ffffff" },
	{ "d52800", "ffffff", "d261a3", "fd9954", "a20060" },
	{ "5b2a2e", "120f19", "a8a4a8", "7b96c6", "665a59" },
	{ "f5ad3e", "ff6787", "38d753", "f7ff74", "000000" },
	{ "ec5642", "ff9d00", "f0e8db", "99c67a", "715f73" },
	{ "ffe001", "150802", "22110b", "da0101", "c89040" },
	{ "5d3e7a", "51383d", "ffffff", "dbd2e2", "251113" },
	{ "d9e2ee", "fdae8e", "776262", "ed7b3c", "fefefe" },
	{ "ff0045", "d924d4", "06053b", "404851", "eda7ba" },
	{ "ba4054", "7a7778", "bba171", "bbb6ba", "010101" },
	{ "ba99ff", "ffa000", "f1f3f4", "ffcd00", "646d7c" },
	{ "f2e8f3", "3e343c", "793027", "67a9f3", "151318" },
	{ "FFD0DF", "c37293", "6DB68C", "C2E0F0", "4C2838" },
	{ "c37293", "6DB68C", "FFD0DF", "4C2838", "C2E0F0" },
	{ "c37293", "6DB68C", "FFD0DF", "c04b67", "ffcd00" },
}

G.C.DORU_GRADIENT = SMODS.Gradient{
 key = "DORU_GRADIENT",
 colours = {HEX("bcffb9"), HEX("4bf0ff")}
}
G.C.Noire = SMODS.Gradient{
	key = "Noire",
	colours = {HEX("000000"), HEX("FFFFFF")}
}

SMODS.Atlas {
	key = 'PALETTE_SPRITES',
	px = 25,
	py = 25,
	disable_mipmap = true;
	path = 'PALETTE_SPRITES.png'
}



SMODS.current_mod.extra_tabs = function()

    return {
                {
                    label = 'Palettes',
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
								ref_value = "palette_num",
								no_pips = true,
								mid = SMODS.GUI.dropdown_select({
									id = "uncardable_palette_dropdown",
									options = localize('uncard_palettes'),
									minw = 5,
									scale = 0.5,
									align = "cm",
									option_align = "cm",
									ref_table = UNCARDABLE.config,
									ref_value = "palette_num",
									callback = "uncardable_palette_drop_change",
									close_on_select = true,
									max_menu_h = 3,
								})
							}),
							create_toggle(
								{
									label = "Keep chip x mult text white",
									active_colour = HEX("E01BDE"),
									ref_table = UNCARDABLE.config,
									ref_value = "whitetext",
								}
							),
							create_toggle(
								{
									label = "Enable PALETTE MANIA. at your own risk",
									active_colour = HEX("E01BDE"),
									ref_table = UNCARDABLE.config,
									ref_value = "PALETTE_MANIA",
								}
							),
							UNCARDABLE.embedded_ui_sprite()
                        }}
                end,
                },
        }
end

function UNCARDABLE.embedded_ui_sprite()
	G.uncardable_config_sprite = SMODS.create_sprite(400, 400, 4, 4, G.ASSET_ATLAS["uncardable_PALETTE_SPRITES"], {x = UNCARDABLE.config.palette_num, y = 0})
	local uiEX =
	{
		n = G.UIT.R,
		config = {align = "cm", padding = 0.07, no_fill = true},
		nodes = {
			{n = G.UIT.O, config = {object = G.uncardable_config_sprite}}
		}
	}
	return uiEX
end

G.FUNCS.uncardable_change_palette = function(color)
	print(UNCARDABLE.config.palette_num)
	UNCARDABLE.config.palette_num = color.to_key
	print(UNCARDABLE.config.palette_num)

	G.uncardable_config_sprite:set_sprite_pos({x=UNCARDABLE.config.palette_num, y = 0})
	--UNCARDABLE.embedded_ui_sprite()
	Blind:change_colour(G.C.BLUE)
	--UNCARDABLE.uncardable_change_ui()
end

G.FUNCS.uncardable_palette_drop_change = function(e)
	--print(e.config.args_table.options)
	local chosenPos
	for key, value in pairs(e.config.args_table.options) do
		if value == e.config.value
		then
			chosenPos = key
		end
	end
	UNCARDABLE.config.palette_num = chosenPos 
	G.uncardable_config_sprite:set_sprite_pos({x=UNCARDABLE.config.palette_num, y = 0})
	Blind:change_colour(G.C.BLUE)
end

function UNCARDABLE.apply_main_colour(color)
	ease_colour(G.C.DYN_UI.MAIN, color)
	ease_colour(G.C.IMPORTANT, color)
	ease_colour(G.C.BLUE, color)
	ease_colour(G.C.ORANGE, color)
	ease_colour(G.C.BLACK, color)
end

function UNCARDABLE.apply_dark_and_mult_colour(color)
	ease_colour(G.C.DYN_UI.DARK, color)
	ease_colour(G.C.RED, color)        
    ease_colour(G.C.XMULT, color)      
end
local blind_color = Blind.change_colour
function Blind:change_colour(blind_col)

    local ret = blind_color(self, blind_col)

	if UNCARDABLE.config.palette_num == 1 then
		blind_col = blind_col or get_blind_main_colour(self.config.blind.key or '')
		ease_colour(G.C.DYN_UI.MAIN, blind_col)
		ease_colour(G.C.BLACK, HEX("374244"))
		dark_col = mix_colours(blind_col, G.C.BLACK, 0.4)
		ease_colour(G.C.DYN_UI.DARK, HEX("374244"))
		 if not self.boss and self.name then 
					blind_col = darken(G.C.BLACK, 0.05)
					dark_col = lighten(G.C.BLACK, 0.07)
			else
					dark_col = mix_colours(blind_col, G.C.BLACK, 0.2)
			end
			ease_colour(G.C.DYN_UI.BOSS_MAIN, blind_col)
			ease_colour(G.C.DYN_UI.BOSS_DARK, dark_col)
		
		ease_colour(G.C.RED, HEX("FE5F55"))
		ease_colour(G.C.XMULT, HEX("FE5F55"))
		ease_colour(G.C.IMPORTANT, HEX("ff9a00"))
		ease_colour(G.C.UI.TEXT_LIGHT, HEX("FFFFFF"))
		ease_colour(G.C.BLUE, HEX("009dff"))
		ease_colour(G.C.ORANGE, HEX("fda200"))

		return ret
	else
		colours = pal[UNCARDABLE.config.palette_num - 1]
		UNCARDABLE.apply_main_colour(HEX(colours[1]))
		UNCARDABLE.apply_dark_and_mult_colour(HEX(colours[2]))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX(colours[3]))
		
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX(colours[4]))
		if UNCARDABLE.config.whitetext == false
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX(colours[5]))
		end
	end
	
	if UNCARDABLE.config.PALETTE_MANIA == true
	then
		--print("changing palette")
		local randompal = math.random(1, 65)
		UNCARDABLE.config.palette_num = randompal
	end
end


local blind_text_col = Game.start_run
function Game:start_run(args)
	G.C.WHITE = {1, 1, 1, 1}
	if UNCARDABLE.config.whitetext == false
	then
	  -- skip 5 and leave fully white text
		if UNCARDABLE.config.palette_num ~= 5 and UNCARDABLE.config.palette_num ~= 1
		then
			G.C.WHITE = HEX(pal[UNCARDABLE.config.palette_num - 1][5])
		end
	end
	local ret = blind_text_col(self, args)
	G.C.WHITE = {1, 1, 1, 1}
end  --yy

local update_col = Game.update
function Game:update(dt)
	G.C.WHITE = {1, 1, 1, 1}
	if UNCARDABLE.config.whitetext == false
	then
	  -- skip 5 and leave fully white text
		if UNCARDABLE.config.palette_num ~= 5 and UNCARDABLE.config.palette_num ~= 1
		then
			G.C.WHITE = HEX(pal[UNCARDABLE.config.palette_num - 1][5])
		end
	end
	local ret = update_col(self, dt)
	G.C.WHITE = {1, 1, 1, 1}
end
