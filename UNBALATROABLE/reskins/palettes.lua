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
							}),
							create_toggle(
								{
									label = "Keep chip x mult text white",
									active_colour = HEX("E01BDE"),
									ref_table = UNCARDABLE.config,
									ref_value = "whitetext",
								}
							)
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
	if UNCARDABLE.config.palette_num == 1
    then 
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
	elseif UNCARDABLE.config.palette_num == 2
	then
		UNCARDABLE.apply_main_colour(HEX("FF4B7D"))
		--[[ease_colour(G.C.DYN_UI.MAIN, HEX("FF4B7D"))
		ease_colour(G.C.IMPORTANT, HEX("FF4B7D"))
		ease_colour(G.C.BLUE, HEX("FF4B7D"))
		ease_colour(G.C.ORANGE, HEX("FF4B7D"))
		ease_colour(G.C.BLACK, HEX("FF487D"))]]
		UNCARDABLE.apply_dark_and_mult_colour(HEX("000000"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("E1DFBF"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("F9F7D5"))
		if UNCARDABLE.config.whitetext == false
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("B4B399"))
		else
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("FFFFFF"))
		end
	elseif UNCARDABLE.config.palette_num == 3
	then
		UNCARDABLE.apply_main_colour(HEX("00b381"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("FFFFFF"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("1e203f"))
		
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("06082a"))
		if UNCARDABLE.config.whitetext == false
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("4b4c66"))
		end
    elseif UNCARDABLE.config.palette_num == 4
	then
		UNCARDABLE.apply_main_colour(HEX("f78536"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("503f3a"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("fec100"))
		
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("feeab9"))
		if UNCARDABLE.config.whitetext == false
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("72615d"))
		end
	elseif UNCARDABLE.config.palette_num == 5
	then
		UNCARDABLE.apply_main_colour(HEX("222222"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("575757"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("c7c7c7"))
		
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("fefefe"))
		ease_colour(G.C.UI.TEXT_LIGHT, HEX("FFFFFF"))
	elseif UNCARDABLE.config.palette_num == 6
	then
		UNCARDABLE.apply_main_colour(HEX("5c7f5f"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("5d8060"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("83ad7d"))
		
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("b1bb7f"))
		if UNCARDABLE.config.whitetext == false
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("66976c"))
		end
	elseif UNCARDABLE.config.palette_num == 7
	then
		UNCARDABLE.apply_main_colour(HEX("4b6fff"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("ff8c4c"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("ededed"))

		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("ededed"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("bfbfbf"))
		end
	elseif UNCARDABLE.config.palette_num == 8
	then
		UNCARDABLE.apply_main_colour(HEX("ff98b1"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("ffaf00"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("ffcbd5"))

		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("ffffff"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("fe6382"))
		end
	elseif UNCARDABLE.config.palette_num == 9
	then
		UNCARDABLE.apply_main_colour(HEX("71daff"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("50dbb6"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("efefef"))

		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("318cd0"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("ff97b0"))
		end
	elseif UNCARDABLE.config.palette_num == 10
	then
		UNCARDABLE.apply_main_colour(HEX("016950"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("0032ff"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("000000"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("adaaa5"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("007763"))
		end
	elseif UNCARDABLE.config.palette_num == 11
	then 
		UNCARDABLE.apply_main_colour(HEX("e1e6e8"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("8c2a2f"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("ff9d71"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("ff0050"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("443c3c"))
		end
	elseif UNCARDABLE.config.palette_num == 12
	then
		UNCARDABLE.apply_main_colour(HEX("eea642"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("e6eaed"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("cdbebe"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("356e8d"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("201a18"))
		end
	elseif UNCARDABLE.config.palette_num == 13
	then
		UNCARDABLE.apply_main_colour(HEX("7552be"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("fe4a74"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("ededed"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("f9d33b"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("636c7b"))
		end
	elseif UNCARDABLE.config.palette_num == 14
	then
		UNCARDABLE.apply_main_colour(HEX("01c1ff"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("000000"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("000000"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("ffffff"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("bfbfbf"))
		end
	elseif UNCARDABLE.config.palette_num == 15
	then
		UNCARDABLE.apply_main_colour(HEX("fafafa"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("9cfc85"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("ff505c"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("000000"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("3b80e7"))
		end
	elseif UNCARDABLE.config.palette_num == 16
	then
		UNCARDABLE.apply_main_colour(HEX("ffffff"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("000000"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("000000"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("ff0026"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("ffffff"))
		end
	elseif UNCARDABLE.config.palette_num == 17
		then
		UNCARDABLE.apply_main_colour(HEX("fffde1"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("000000"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("e97478"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("39e3b9"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("fffde1"))
		end
	elseif UNCARDABLE.config.palette_num == 18
	then 
		UNCARDABLE.apply_main_colour(HEX("ff6e6e"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("7774d3"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("ffd454"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("ededed"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("e16374"))
		end
	elseif UNCARDABLE.config.palette_num == 19
	then 
		UNCARDABLE.apply_main_colour(HEX("e26474"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("000000"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("4a93e9"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("595a70"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("fefefe"))
		end
	elseif UNCARDABLE.config.palette_num == 20
	then 
		UNCARDABLE.apply_main_colour(HEX("cdf5b7"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("e4a883"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("4f5969"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("4a93e9"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("ececec"))
		end
	elseif UNCARDABLE.config.palette_num == 21
	then 
		UNCARDABLE.apply_main_colour(HEX("fe004f"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("86d9aa"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("ff9d71"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("e1e6e8"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("443c3c"))
		end
	elseif UNCARDABLE.config.palette_num == 22
	then 
		UNCARDABLE.apply_main_colour(HEX("25c51d"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("748cff"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("f01451"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("020015"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("316be9"))
		end
	elseif UNCARDABLE.config.palette_num == 23
	then 
		UNCARDABLE.apply_main_colour(HEX("cdf5b7"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("364150"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("4d5d71"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("252e39"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("4a92e9"))
		end
	elseif UNCARDABLE.config.palette_num == 24
	then 
		UNCARDABLE.apply_main_colour(HEX("f7889d"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("3c3c3c"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("36b5e5"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("f7f7f7"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("eb7e93"))
		end
	elseif UNCARDABLE.config.palette_num == 25
	then 
		UNCARDABLE.apply_main_colour(HEX("ffffff"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("e2d8ff"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("6127ff"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("ff388e"))
		--if(UNCARDABLE.config.whitetext == false)
		--then
		--	ease_colour(G.C.UI.TEXT_LIGHT, HEX("2d0012"))
		--end
	elseif UNCARDABLE.config.palette_num == 26
	then 
		UNCARDABLE.apply_main_colour(HEX("d5d7e8"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("232966"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("54a5e3"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("e25e57"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("fdca69"))
		end
	elseif UNCARDABLE.config.palette_num == 27
	then 
		UNCARDABLE.apply_main_colour(HEX("e3465d"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("4d435f"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("4d435f"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("d8ac8c"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("61494d"))
		end
	elseif UNCARDABLE.config.palette_num == 28
	then 
		UNCARDABLE.apply_main_colour(HEX("e3851c"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("593740"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("949813"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("565b88"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("b28e79"))
		end
	elseif UNCARDABLE.config.palette_num == 29
	then 
		UNCARDABLE.apply_main_colour(HEX("742c7e"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("e9c037"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("1d63a2"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("020202"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("dadde6"))
		end
	elseif UNCARDABLE.config.palette_num == 30
	then 
		UNCARDABLE.apply_main_colour(HEX("e75155"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("ffd4b3"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("8bebb1"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("312f95"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("b9db58"))
		end
	elseif UNCARDABLE.config.palette_num == 31
	then 
		UNCARDABLE.apply_main_colour(HEX("2de5fe"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("fff400"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("f13762"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("000000"))
		G.C.UI.TEXT_LIGHT = HEX("FFFFFF")
	elseif UNCARDABLE.config.palette_num == 32
	then 
		UNCARDABLE.apply_main_colour(HEX("ff1e08"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("1097f7"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("ffb410"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("ffebba"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("013770"))
		end
	elseif UNCARDABLE.config.palette_num == 33 --PostergirlXOXO
	then 
		UNCARDABLE.apply_main_colour(HEX("e664bb"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("c069b6"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("ffaff0"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("ffcdf2"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("e880d0"))
		end
	elseif UNCARDABLE.config.palette_num == 34 --Ikeiwa
	then 
		UNCARDABLE.apply_main_colour(HEX("f8a219"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("f8f4e9"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("3e4e5e"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("2f3b47"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("4f6377"))
		end
	elseif UNCARDABLE.config.palette_num == 35 --Starburst
	then 
		UNCARDABLE.apply_main_colour(HEX("b5b5b5"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("5b83a5"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("bf9d46"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("372f80"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("5f5f5f"))
		end
	elseif UNCARDABLE.config.palette_num == 36 --Nocturne
	then 
		UNCARDABLE.apply_main_colour(HEX("fd0b68"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("ffffff"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("001838"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("09001f"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("ededed"))
		end
	elseif UNCARDABLE.config.palette_num == 37 --Mascot Dragon
	then 
		UNCARDABLE.apply_main_colour(HEX("a05fbb"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("65195f"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("ff9d71"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("290050"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("dee5e6"))
		end
	elseif UNCARDABLE.config.palette_num == 38 --(spell)BANG
	then
		UNCARDABLE.apply_main_colour(HEX("ff178b"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("000000"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("8effb8"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("fefc50"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("2c60c3"))
		end
	elseif UNCARDABLE.config.palette_num == 39 --Sleepy Hour
	then
		UNCARDABLE.apply_main_colour(HEX("ffbbde"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("1d173d"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("dc7ddb"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("493a7d"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("fff0dc"))
		end
	elseif UNCARDABLE.config.palette_num == 40 --Mighty Magical
	then
		UNCARDABLE.apply_main_colour(HEX("ff7773"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("b21b54"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("ef9736"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("f6caa3"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("cf2c57"))
		end
	elseif UNCARDABLE.config.palette_num == 41 --Gungworks
	then
		UNCARDABLE.apply_main_colour(HEX("a08b60"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("0a1c36"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("48638b"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("e0dbd4"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("614c22"))
		end
	elseif UNCARDABLE.config.palette_num == 42 --Niko
	then
		UNCARDABLE.apply_main_colour(HEX("431e26"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("fee03d"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("5e44fa"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("c04b67"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("6d2a36"))
		end
	elseif UNCARDABLE.config.palette_num == 43 --Darkmode
	then
		UNCARDABLE.apply_main_colour(HEX("151515"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("9c6fff"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("3d3d3d"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("ffffff"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("5191f2"))
		end
	elseif UNCARDABLE.config.palette_num == 44 --Green With It
	then
		UNCARDABLE.apply_main_colour(HEX("068a1f"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("f6f6f6"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("00f700"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("8ac64d"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("113113"))
		end
	elseif UNCARDABLE.config.palette_num == 45 --Deluxe
	then
		UNCARDABLE.apply_main_colour(HEX("fe3268"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("fe953f"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("b9d3de"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("ededed"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("9f9f9f"))
		end
	elseif UNCARDABLE.config.palette_num == 46 --Crest
	then
		UNCARDABLE.apply_main_colour(HEX("3d445f"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("e3e8e8"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("676e90"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("87a1c5"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("565a5e"))
		end
	elseif UNCARDABLE.config.palette_num == 47 --DC
	then
		UNCARDABLE.apply_main_colour(HEX("a3a39c"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("6f8cf6"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("3f3e45"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("6a5960"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("c1c0c6"))
		end
	elseif UNCARDABLE.config.palette_num == 48 --Penny
	then
		UNCARDABLE.apply_main_colour(HEX("b19494"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("e2e6e8"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("ffdf01"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("2f2f2f"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("d87342"))
		end
	elseif UNCARDABLE.config.palette_num == 49 --Sforzando
	then
		UNCARDABLE.apply_main_colour(HEX("2f2f2f"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("fef100"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("6a5961"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("b29595"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("e2e6e8"))
		end
	elseif UNCARDABLE.config.palette_num == 50 --Birdbrain
	then
		UNCARDABLE.apply_main_colour(HEX("eb3232"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("ffcd33"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("fecd32"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("f5ebeb"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("000000"))
		end
	elseif UNCARDABLE.config.palette_num == 51 --Birdbrain Inverted
	then
		UNCARDABLE.apply_main_colour(HEX("15cece"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("0132cc"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("0031cc"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("0a1414"))
		ease_colour(G.C.UI.TEXT_LIGHT, HEX("ffffff"))
	elseif UNCARDABLE.config.palette_num == 52 --Girls Love Girls!
	then
		UNCARDABLE.apply_main_colour(HEX("d52801"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("ffffff"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("d261a3"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("fd9954"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("a20060"))
		end
	elseif UNCARDABLE.config.palette_num == 53 --Greg's Truck
	then
		UNCARDABLE.apply_main_colour(HEX("5b2a2e"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("120f19"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("a8a4a8"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("7b96c6"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("665a59"))
		end
	elseif UNCARDABLE.config.palette_num == 54 --Gumball
	then
		UNCARDABLE.apply_main_colour(HEX("f5ad3e"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("ff6787"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("38d753"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("f7ff74"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("000000"))
		end
	elseif UNCARDABLE.config.palette_num == 55 --Jamie Paige
	then
		UNCARDABLE.apply_main_colour(HEX("ec5642"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("ff9d00"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("f0e8db"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("99c67a"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("715f73"))
		end
	elseif UNCARDABLE.config.palette_num == 56 --Malwort
	then
		UNCARDABLE.apply_main_colour(HEX("ffe001"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("150802"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("22110b"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("da0101"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("c89040"))
		end
	elseif UNCARDABLE.config.palette_num == 57 --Paisley Pudge
	then
		UNCARDABLE.apply_main_colour(HEX("5d3e7a"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("51383d"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("ffffff"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("dbd2e2"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("251113"))
		end
	elseif UNCARDABLE.config.palette_num == 58 -- Shrimp
	then
		UNCARDABLE.apply_main_colour(HEX("d9e2ee"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("fdae8e"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("776262"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("ed7b3c"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("fefefe"))
		end
	elseif UNCARDABLE.config.palette_num == 59 -- Twindrill (Dark)
	then
		UNCARDABLE.apply_main_colour(HEX("ff0045"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("d924d4"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("06053b"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("404851"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("eda7ba"))
		end
	elseif UNCARDABLE.config.palette_num == 60 -- Twindrill (Light)
	then
		UNCARDABLE.apply_main_colour(HEX("ba4054"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("7a7778"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("bba171"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("bbb6ba"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("010101"))
		end
	elseif UNCARDABLE.config.palette_num == 61 -- Treble
	then
		UNCARDABLE.apply_main_colour(HEX("ba99ff"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("ffa000"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("f1f3f4"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("ffcd00"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("646d7c"))
		end
	elseif UNCARDABLE.config.palette_num == 62 -- RJ
	then
		UNCARDABLE.apply_main_colour(HEX("f2e8f3"))
		UNCARDABLE.apply_dark_and_mult_colour(HEX("3e343c"))
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("793027"))
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("67a9f3"))
		if(UNCARDABLE.config.whitetext == false)
		then
			ease_colour(G.C.UI.TEXT_LIGHT, HEX("151318"))
		end
	--[[elseif UNCARDABLE.config.palette_num == 9
	then
		ease_colour(G.C.DYN_UI.MAIN, HEX("70d9ff")) --border and behind Small Blind text
		ease_colour(G.C.DYN_UI.DARK, HEX("4fdab6")) -- behind the blind chip
		ease_colour(G.C.DYN_UI.BOSS_MAIN, HEX("efefef")) -- behind Round Score, Hands, Discards text
		ease_colour(G.C.DYN_UI.BOSS_DARK, HEX("318bcf")) -- background of UI
		ease_colour(G.C.RED, HEX("4fdab6")) 
		--ease_colour(G.C.XMULT, HEX("4fdab6"))
		ease_colour(G.C.IMPORTANT, HEX("70d9ff"))
		ease_colour(G.C.UI.TEXT_LIGHT, HEX("ff97b0"))
		ease_colour(G.C.BLUE, HEX("70d9ff"))
		ease_colour(G.C.ORANGE, HEX("70d9ff"))
		--ease_colour(G.C.DYN_UI.BOSS_PALE, HEX("ff97b0")) -- possibly also the Sort Hand outsides?
		--G.C.UI.TEXT_DARK = HEX("ff97b0") -- i have literally no idea
		--G.C.UI.TEXT_INACTIVE = HEX("ff97b0") --sets the colours for the "Play Hand" and "Discard" when not in use
		--G.C.WHITE = HEX("ff97b0") -- does change everything. but also tints the entire god damn screen.]]
	end
end


local blind_text_col = Game.start_run
function Game:start_run(args)
	G.C.WHITE = {1, 1, 1, 1}
	if UNCARDABLE.config.whitetext == false
	then
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
			G.C.WHITE = {1, 1, 1, 1}
		elseif UNCARDABLE.config.palette_num == 6
		then
			G.C.WHITE = HEX("66976c")
		elseif UNCARDABLE.config.palette_num == 7
		then
			G.C.WHITE = HEX("bfbfbf")
		elseif UNCARDABLE.config.palette_num == 8
		then
			G.C.WHITE = HEX("fe6382")
		elseif UNCARDABLE.config.palette_num == 9
		then
			G.C.WHITE = HEX("ff97b0")
			--G.C.RED = HEX("4fdab6")
		elseif UNCARDABLE.config.palette_num == 10
		then
			G.C.WHITE = HEX("007763")
		elseif UNCARDABLE.config.palette_num == 11
		then
			G.C.WHITE = HEX("443c3c")
		elseif UNCARDABLE.config.palette_num == 12
		then
			G.C.WHITE = HEX("201a18")
		elseif UNCARDABLE.config.palette_num == 13
		then
			G.C.WHITE = HEX("636c7b")
		elseif UNCARDABLE.config.palette_num == 14
		then
			G.C.WHITE = HEX("bfbfbf")
		elseif UNCARDABLE.config.palette_num == 15
		then
			G.C.WHITE = HEX("3b80e7")
		elseif UNCARDABLE.config.palette_num == 16
		then
			G.C.WHITE = HEX("ffffff")
		elseif UNCARDABLE.config.palette_num == 17
		then
			G.C.WHITE = HEX("fffde1")
		elseif UNCARDABLE.config.palette_num == 18
		then
			G.C.WHITE = HEX("e16374")
		elseif UNCARDABLE.config.palette_num == 19
		then
			G.C.WHITE = HEX("fefefe")
		elseif UNCARDABLE.config.palette_num == 20
		then
			G.C.WHITE = HEX("ececec")
		elseif UNCARDABLE.config.palette_num == 21
		then
			G.C.WHITE = HEX("443c3c")
		elseif UNCARDABLE.config.palette_num == 22
		then
			G.C.WHITE = HEX("316be9")
		elseif UNCARDABLE.config.palette_num == 23
		then
			G.C.WHITE = HEX("4a92e9")
		elseif UNCARDABLE.config.palette_num == 24
		then
			G.C.WHITE = HEX("eb7e93")
		elseif UNCARDABLE.config.palette_num == 25
		then
			G.C.WHITE = HEX("2d0013")
		elseif UNCARDABLE.config.palette_num == 26
		then
			G.C.WHITE = HEX("fdca69")
		elseif UNCARDABLE.config.palette_num == 27
		then
			G.C.WHITE = HEX("61494d")
		elseif UNCARDABLE.config.palette_num == 28
		then
			G.C.WHITE = HEX("b28e79")
		elseif UNCARDABLE.config.palette_num == 29
		then
			G.C.WHITE = HEX("dadde6")
		elseif UNCARDABLE.config.palette_num == 30
		then
			G.C.WHITE = HEX("b9db58")
		elseif UNCARDABLE.config.palette_num == 31
		then
			G.C.WHITE = HEX("ffffff")
		elseif UNCARDABLE.config.palette_num == 32
		then
			G.C.WHITE = HEX("013871")
		elseif UNCARDABLE.config.palette_num == 33
		then
			G.C.WHITE = HEX("e880d0")
		elseif UNCARDABLE.config.palette_num == 34
		then
			G.C.WHITE = HEX("4f6377")
		elseif UNCARDABLE.config.palette_num == 35
		then
			G.C.WHITE = HEX("5f5f5f")
		elseif UNCARDABLE.config.palette_num == 36
		then
			G.C.WHITE = HEX("ededed")
		elseif UNCARDABLE.config.palette_num == 37
		then
			G.C.WHITE = HEX("dee5e6")
		elseif UNCARDABLE.config.palette_num == 38
		then
			G.C.WHITE = HEX("2c60c3")
		elseif UNCARDABLE.config.palette_num == 39
		then
			G.C.WHITE = HEX("fff0dc")
		elseif UNCARDABLE.config.palette_num == 40
		then
			G.C.WHITE = HEX("cf2c57")
		elseif UNCARDABLE.config.palette_num == 41
		then
			G.C.WHITE = HEX("614d23")
		elseif UNCARDABLE.config.palette_num == 42
		then
			G.C.WHITE = HEX("6d2a36")
		elseif UNCARDABLE.config.palette_num == 43
		then
			G.C.WHITE = HEX("5191f2")
		elseif UNCARDABLE.config.palette_num == 44
		then
			G.C.WHITE = HEX("113113")
		elseif UNCARDABLE.config.palette_num == 45
		then
			G.C.WHITE = HEX("9f9f9f")
		elseif UNCARDABLE.config.palette_num == 46
		then
			G.C.WHITE = HEX("565a5e")
		elseif UNCARDABLE.config.palette_num == 47
		then
			G.C.WHITE = HEX("c1c0c6")
		elseif UNCARDABLE.config.palette_num == 48
		then
			G.C.WHITE = HEX("d87342")
		elseif UNCARDABLE.config.palette_num == 49
		then
			G.C.WHITE = HEX("e2e6e8")
		elseif UNCARDABLE.config.palette_num == 50
		then
			G.C.WHITE = HEX("000000")
		elseif UNCARDABLE.config.palette_num == 51
		then
			G.C.WHITE = HEX("ffffff")
		elseif UNCARDABLE.config.palette_num == 52
		then
			G.C.WHITE = HEX("a20060")
		elseif UNCARDABLE.config.palette_num == 53
		then
			G.C.WHITE = HEX("665a59")
		elseif UNCARDABLE.config.palette_num == 54
		then
			G.C.WHITE = HEX("000000")
		elseif UNCARDABLE.config.palette_num == 55
		then
			G.C.WHITE = HEX("715f73")
		elseif UNCARDABLE.config.palette_num == 56
		then
			G.C.WHITE = HEX("c89040")
		elseif UNCARDABLE.config.palette_num == 57
		then
			G.C.WHITE = HEX("251113")
		elseif UNCARDABLE.config.palette_num == 58
		then
			G.C.WHITE = HEX("fefefe")
		elseif UNCARDABLE.config.palette_num == 59
		then
			G.C.WHITE = HEX("eda7ba")
		elseif UNCARDABLE.config.palette_num == 60
		then
			G.C.WHITE = HEX("010101")
		elseif UNCARDABLE.config.palette_num == 61
		then
			G.C.WHITE = HEX("646d7c")
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
			G.C.WHITE = {1, 1, 1, 1}
		elseif UNCARDABLE.config.palette_num == 6
		then
			G.C.WHITE = HEX("66976c")
		elseif UNCARDABLE.config.palette_num == 7
		then
			G.C.WHITE = HEX("bfbfbf")
		elseif UNCARDABLE.config.palette_num == 8
		then
			G.C.WHITE = HEX("fe6382")
		elseif UNCARDABLE.config.palette_num == 9
		then
			G.C.WHITE = HEX("ff97b0")
		elseif UNCARDABLE.config.palette_num == 10
		then
			G.C.WHITE = HEX("007763")
		 elseif UNCARDABLE.config.palette_num == 11
		then
			G.C.WHITE = HEX("443c3c")
		elseif UNCARDABLE.config.palette_num == 12
		then
			G.C.WHITE = HEX("201a18")
		elseif UNCARDABLE.config.palette_num == 13
		then
			G.C.WHITE = HEX("636c7b")
		elseif UNCARDABLE.config.palette_num == 14
		then
			G.C.WHITE = HEX("bfbfbf")
		elseif UNCARDABLE.config.palette_num == 15
		then
			G.C.WHITE = HEX("3b80e7")
		elseif UNCARDABLE.config.palette_num == 16
		then
			G.C.WHITE = HEX("ffffff")
		elseif UNCARDABLE.config.palette_num == 17
		then
			G.C.WHITE = HEX("fffde1")
		elseif UNCARDABLE.config.palette_num == 18
		then
			G.C.WHITE = HEX("e16374")
		elseif UNCARDABLE.config.palette_num == 19
		then
			G.C.WHITE = HEX("fefefe")
		elseif UNCARDABLE.config.palette_num == 20
		then
			G.C.WHITE = HEX("ececec")
		elseif UNCARDABLE.config.palette_num == 21
		then
			G.C.WHITE = HEX("443c3c")
		elseif UNCARDABLE.config.palette_num == 22
		then
			G.C.WHITE = HEX("316be9")
		elseif UNCARDABLE.config.palette_num == 23
		then
			G.C.WHITE = HEX("4a92e9")
		elseif UNCARDABLE.config.palette_num == 24
		then
			G.C.WHITE = HEX("eb7e93")
		elseif UNCARDABLE.config.palette_num == 25
		then
			G.C.WHITE = HEX("2d0013")
		elseif UNCARDABLE.config.palette_num == 26
		then
			G.C.WHITE = HEX("fdca69")
		elseif UNCARDABLE.config.palette_num == 27
		then
			G.C.WHITE = HEX("61494d")
		elseif UNCARDABLE.config.palette_num == 28
		then
			G.C.WHITE = HEX("b28e79")
		elseif UNCARDABLE.config.palette_num == 29
		then
			G.C.WHITE = HEX("dadde6")
		elseif UNCARDABLE.config.palette_num == 30
		then
			G.C.WHITE = HEX("b9db58")
		elseif UNCARDABLE.config.palette_num == 31
		then
			G.C.WHITE = HEX("ffffff")
		elseif UNCARDABLE.config.palette_num == 32
		then
			G.C.WHITE = HEX("013871")
		elseif UNCARDABLE.config.palette_num == 33
		then
			G.C.WHITE = HEX("e880d0")
		elseif UNCARDABLE.config.palette_num == 34
		then
			G.C.WHITE = HEX("4f6377")
		elseif UNCARDABLE.config.palette_num == 35
		then
			G.C.WHITE = HEX("5f5f5f")
		elseif UNCARDABLE.config.palette_num == 36
		then
			G.C.WHITE = HEX("ededed")
		elseif UNCARDABLE.config.palette_num == 37
		then
			G.C.WHITE = HEX("dee5e6")
		elseif UNCARDABLE.config.palette_num == 38
		then
			G.C.WHITE = HEX("2c60c3")
		elseif UNCARDABLE.config.palette_num == 39
		then
			G.C.WHITE = HEX("fff0dc")
		elseif UNCARDABLE.config.palette_num == 40
		then
			G.C.WHITE = HEX("cf2c57")
		elseif UNCARDABLE.config.palette_num == 41
		then
			G.C.WHITE = HEX("614d23")
		elseif UNCARDABLE.config.palette_num == 42
		then
			G.C.WHITE = HEX("6d2a36")
		elseif UNCARDABLE.config.palette_num == 43
		then
			G.C.WHITE = HEX("5191f2")
		elseif UNCARDABLE.config.palette_num == 44
		then
			G.C.WHITE = HEX("113113")
		elseif UNCARDABLE.config.palette_num == 45
		then
			G.C.WHITE = HEX("9f9f9f")
		elseif UNCARDABLE.config.palette_num == 46
		then
			G.C.WHITE = HEX("565a5e")
		elseif UNCARDABLE.config.palette_num == 47
		then
			G.C.WHITE = HEX("c1c0c6")
		elseif UNCARDABLE.config.palette_num == 48
		then
			G.C.WHITE = HEX("d87342")
		elseif UNCARDABLE.config.palette_num == 49
		then
			G.C.WHITE = HEX("e2e6e8")
		elseif UNCARDABLE.config.palette_num == 50
		then
			G.C.WHITE = HEX("000000")
		elseif UNCARDABLE.config.palette_num == 51
		then
			G.C.WHITE = HEX("ffffff")
		elseif UNCARDABLE.config.palette_num == 52
		then
			G.C.WHITE = HEX("a20060")
		elseif UNCARDABLE.config.palette_num == 53
		then
			G.C.WHITE = HEX("665a59")
		elseif UNCARDABLE.config.palette_num == 54
		then
			G.C.WHITE = HEX("000000")
		elseif UNCARDABLE.config.palette_num == 55
		then
			G.C.WHITE = HEX("715f73")
		elseif UNCARDABLE.config.palette_num == 56
		then
			G.C.WHITE = HEX("c89040")
		elseif UNCARDABLE.config.palette_num == 57
		then
			G.C.WHITE = HEX("251113")
		elseif UNCARDABLE.config.palette_num == 58
		then
			G.C.WHITE = HEX("fefefe")
		elseif UNCARDABLE.config.palette_num == 59
		then
			G.C.WHITE = HEX("eda7ba")
		elseif UNCARDABLE.config.palette_num == 60
		then
			G.C.WHITE = HEX("010101")
		elseif UNCARDABLE.config.palette_num == 61
		then
			G.C.WHITE = HEX("646d7c")
		end
	end
	local ret = update_col(self, dt)
	G.C.WHITE = {1, 1, 1, 1}
end