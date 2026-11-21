UNCARDABLE.credits = 
{ 
	{ -- page
		{ -- the three per page
			{
			"heroofyore", --credit name. MUST MATCH ARTISTUI DOC
			{
				"Jokers",
				"Code",
				"Spectrals",
				"Tarot",
				"Blinds",
				"Tags",
				"Vouchers",
				"...and everything else"
			}, -- credited for
			"agglomeration1", -- throw an atlas name here
			"4", -- and a position
			},
			{
				"guac",
				{
					"Jokers",
					"Code",
					"Spectrals",
					"Decks",
					"All Planets",
					"Vouchers",
					"Seals",
					"and more",
				},
				"worked on basically everything, as well",
			},
			{
				"ploutre",
				{
					"Jokers",
					"Tarot",
					"A Voucher",
				},
				"Buncha jokers",
			}
		},
	},
	{ -- page 2
		{
			{
				"ermywurm",
				{
					"Jokers",
				},
			},
			{
				"murdock",
				{
					"Jokers",
				},
			},
			{
				"stanza",
				{
					"Jokers",
					"Cardbacks",
					"Boosters",
				},
			}
		}
	},
	{ -- page 3
		{
			{
				"$7bramble",
				{
					"Jokers",
				},
			},
			{
				"8z",
				{
					"Jokers",
				},
			},
			{
				"objitude",
				{
					"Jokers",
				},
			}
		}
	},
	{ -- 4
		{
			{
				"epicelle",
				{
					"Jokers",
				},				
			},
			{
				"birb",
				{
					"Jokers",
				},
			},
			{
				"$3suvi",
				{
					"Jokers",
				},
			},
		}
	},
	{ -- 5
		{
			{
				"yuki",
				{
					"Jokers",
				},
			},
			{
				"ribbown",
				{
					"Tags",
				}
			},
			{
				"$2nonexistante",
				{
					"Tarot",
				}
			},
		}
	}
}


SMODS.current_mod.credits_tab = function()
    return UNCARDABLE.credits_tab
end


function UNCARDABLE.craft_credit(name, credit, atl, pos)
	local credited_for = {}
	for _, line in ipairs(credit) do
		table.insert(credited_for, {
			n= G.UIT.R,
			config = {
				align = "cl",
			},
			nodes = {
				{
					n = G.UIT.T,
					config = {
					text = line,
					scale = 0.4,
					colour = G.C.RED,
					}
				}
			}			
		})
	end
	return {
		n = G.UIT.C,
		config = { align = "tm", padding = 0.1},
		nodes = {
			{
				n = G.UIT.C,
				config = {
					align = "cm",
					colour = G.C.BLUE,
					padding = 0.1,
					r = 0.1,
				},
				nodes = {
					{
						n = G.UIT.R,
						config = {
							align = "cm",
							colour = G.C.BLACK,
							padding = 0.1,
							r = 0.1,
							
						},
						nodes = credit_node(name)
					},
					{
						n = G.UIT.R,
						config = {
							align = "cl",
							padding = 0.1,
							r = 0.1,
							
						},
						nodes = {
							{
								n = G.UIT.C,
								config = {
									align = "cl",
									padding = 0.1,
									r = 0.1,
								},
								nodes =	credited_for,
							}
						}
					},
				}
			}
		}
	}

end


function UNCARDABLE.display_credits(page)
	credit_columns = {}
	for _, row in ipairs(UNCARDABLE.credits[page]) do
		local credit_items = {}
		for _, item in ipairs(row) do -- fuck with this once it's working
			table.insert(credit_columns, UNCARDABLE.craft_credit(item[1], item[2]))
		end
	end
	print(#credit_columns)

	return {
				n = G.UIT.R,
				config = {align = "ct"},
				nodes = credit_columns,
	}
end

function UNCARDABLE.credits_tab()
	UNCARDABLE.selected_credit_page = UNCARDABLE.selected_credit_page or 1
	return {
		n = G.UIT.ROOT,
		config = { colour = G.C.BLACK, align = "cm", r = 0.1, padding = 0.1, emboss = 0.05},
		nodes = {
			{
				n = G.UIT.O,
				config = {
					id = "uncardable_credits_page_active",
					object = UIBox({
						definition = UNCARDABLE.credit_tab_def(UNCARDABLE.selected_credit_page),
						config = { type = "cm"},
					}),
				},
				align = "ct",
			},
		},
	}
end

function G.FUNCS.uncardable_select_credits_page(args)
	if not G.OVERLAY_MENU then
		return
	end
	UNCARDABLE.selected_credit_page = args.to_key
	local def = UNCARDABLE.credit_tab_def(UNCARDABLE.selected_credit_page)
	local container = G.OVERLAY_MENU:get_UIE_by_ID("uncardable_credits_page_active")
	if container then
		container.config.object:remove()
		container.config.object = UIBox({
			definition = def,
			config = {type = "cm", parent = container},
		})
		container.config.object:recalculate()
	end
end

function UNCARDABLE.credit_tab_def(page)
	local credit_nodes = {}
	table.insert(credit_nodes, UNCARDABLE.display_credits(page))
	local credit_pages = {}
	for i, _ in ipairs(UNCARDABLE.credits) do
		table.insert(credit_pages, localize("k_page") .. string.format(" %s/%s", i, #UNCARDABLE.credits))
	end
	table.insert(credit_nodes, {
		n = G.UIT.R,
		config = {align = "cm"},
		nodes = {
			{
				n = G.UIT.C,
				config = {
				},
				nodes = {
					create_option_cycle({
						options = credit_pages,
						current_option = page,
						opt_callback = "uncardable_select_credits_page"
					}),
				},
			},
		},
	})
	--print(#credit_nodes)
	return {
		n = G.UIT.ROOT,
		config = {align = "cm", colour = G.C.BLACK, padding = 0.1, minh = 4},
		nodes = {
			{
				n = G.UIT.C,
				config = {align = "cm", padding = 0.1},
				nodes = credit_nodes,
			},
		}
	}
end


function credit_node(name)
	local credit_name_nodes = {}
	if string.sub(name, 1, 1) == "$" then
		local index = tonumber(string.sub(name, 2, 2))
		for i = 1, index, 1 do
			table.insert(credit_name_nodes, 
		{
			n = G.UIT.O, config = {
				object = DynaText({string = localize{type = 'raw_descriptions', set = 'UNCARDABLE Artist', key = name .. i },
				colours = {G.ARGS.LOC_COLOURS[name..i] or G.C.WHITE},
				bump = true,
				silent = true,
				pop_in = 0,
				pop_in_rate = 4,
				shadow = true,
				y_offset = -0.6,
				scale = 0.4,
				})
			}
		})
		end
	else
	table.insert(credit_name_nodes,
	{n = G.UIT.O, config =
		{
			object = DynaText({string = localize{type = 'raw_descriptions', set = 'UNCARDABLE Artist', key = name},
			colours = {G.ARGS.LOC_COLOURS[name] or G.C.WHITE},
			bump = true,
			silent = true,
			pop_in = 0,
			pop_in_rate = 4,
			shadow = true,
			y_offset = -0.6,
			scale = 0.4,
			})
		}
	})
	end
	return credit_name_nodes
end