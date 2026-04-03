

local base_ease_dollars = ease_dollars
function ease_dollars(mod, x)
    base_ease_dollars(mod, x)

    SMODS.calculate_context({uncardable_ease_dollars = mod})

end

G.FUNCS.total_reskins = function(e)
	G.uncard_prev_collec = "total_reskins"
    G.FUNCS.overlay_menu({
        definition = UNCARDABLE_create_UIBox_your_collection_content_sets(),
    })
end

function UNCARDABLE_create_UIBox_your_collection_content_sets()
	local deck_tables = {}

	G.your_collection = {}
	for j = 1, 3 do
		G.your_collection[j] = CardArea(
			G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2,
			G.ROOM.T.h,
			5 * G.CARD_W,
			0.95 * G.CARD_H,
			{card_limit = 4, type = "title", highlight_limit = 0, collection = true }
		)
		table.insert(deck_tables, {
			n = G.UIT.R,
			config = {align = "cm", padding = 0.07, no_fill = true},
			nodes = {
				{n = G.UIT.O, config = {object = G.your_collection[j] } },
			},
		})
	end
	
	local joker_pool = {}
	for k, v in pairs(G.P_CENTER_POOLS.Joker) do
		if not v.original_mod then
			table.insert(joker_pool, v)
			print(v.key)
		end
		--print(v.original_mod.id)
	end
	local joker_options = {}
	for i = 1, math.ceil(#joker_pool / (5 * #G.your_collection)) do
		table.insert(
			joker_options, 
			"Page " 
			.. tostring(i) 
			.. "/" 
			.. tostring(math.ceil(#joker_pool / (5 * #G.your_collection)))
		)
	end

	local indexnum = 1
	for i = 1, #G.your_collection do
		for j = 1, 5 do
			local center = joker_pool[indexnum]
			print(center.key, #G.your_collection, joker_pool[indexnum].key)
			local card = Card(G.your_collection[i].T.x + G.your_collection[i].T.w / 2, G.your_collection[i].T.y, G.CARD_W,G.CARD_H,nil, G.P_CENTERS[center.key])
			
			G.your_collection[i]:emplace(card)
			indexnum = indexnum + 1
		end
	end

	local t = create_UIBox_generic_options({
		back_func = G.ACTIVE_MOD_UI and "openModUI_" .. G.ACTIVE_MOD_UI.id or "your_collection",
		contents = {
			{ n = G.UIT.R, config = { align = "cm", r = 0.1, colour = G.C.BLACK, emboss = 0.05 }, nodes = deck_tables },
			{
				n = G.UIT.R,
				config = { align = "cm" },
				nodes = {
					create_option_cycle({
						options = joker_options,
						w = 4.5,
						cycle_shoulders = true,
						opt_callback = "uncardable_your_collection_content_set_page",
						current_option = 1,
						colour = G.C.RED,
						no_pips = true,
						focus_args = {snap_to = true, nav = "wide"},
					})
				}
			}
		}
	})
	return t
end

function UNCARDABLE_create_UIBox_your_collection_current_set()
	local deck_tables = {}
	G.your_collection = {}
	for j = 1, 3 do
		G.your_collection[j] = CardArea(
			G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2,
			G.ROOM.T.h,
			5 * G.CARD_W,
			0.95 * G.CARD_H,
			{card_limit = 4, type = "title", highlight_limit = 0, collection = true }
		)
		table.insert(deck_tables, {
			n = G.UIT.R,
			config = {align = "cm", padding = 0.07, no_fill = true},
			nodes = {
				{n = G.UIT.O, config = {object = G.your_collection[j] } },
			},
		})
	end

	joker_pool = {}
	for j = 1, #G.P_CENTER_POOLS.Joker do
		print(G.P_CENTER_POOLS.Joker[j].name)
	end

	local joker_options = {}
	for i = 1, math.ceil(#G.P_CENTER_POOLS.Joker / (5 * #G.your_collection)) do
		table.insert(
			joker_options,
			"Page"
				.. " "
				.. tostring(i)
				.. "/"
				.. tostring(math.ceil(#G.P_CENTER_POOLS.Joker / (5 * #G.your_collection)))
		)
	end

	INIT_COLLECTION_CARD_ALERTS()

	local t = create_UIBox_generic_options({
		contents = {
			{n = G.UIT.R, config = {align = "cm", r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes = deck_tables}
		}
	})
	return t
end

G.FUNCS.uncardable_your_collection_content_set_page = function(args)
	if not args or not args.cycle_config then
		return
	end
	for j = 1, #G.your_collection do
		for i = #G.your_collection[j].cards, 1, -1 do
			local c = G.your_collection[j]:remove_card(G.your_collection[j].cards[i])
			c:remove()
			c = nil
		end
	end
	local joker_pool = {}
	for k, v in pairs(G.P_CENTER_POOLS.Joker) do
		if not v.original_mod then
			table.insert(joker_pool, v)
		end
	end

	local indexnum = 1
	for i = 1, #G.your_collection do
		for j = 1, 5 do
			local center = joker_pool[indexnum + (5 * #G.your_collection * (args.cycle_config.current_option - 1))]
			local card = Card(G.your_collection[i].T.x + G.your_collection[i].T.w / 2, G.your_collection[i].T.y, G.CARD_W,G.CARD_H,nil, G.P_CENTERS[center.key])
			
			G.your_collection[i]:emplace(card)
			indexnum = indexnum + 1
		end
	end
	INIT_COLLECTION_CARD_ALERTS()
end

function UNCARDABLE.generic_card(center, x, y)
	local card = Card(
		x or G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2,
		y or G.ROOM.T.h,
		G.CARD_W,
		G.CARD_H,
		nil,
		G.P_CENTERS.c_base
	)

	return card
end


local card_click_ref = Card.click
function Card:click()
	card_click_ref(self)
	if G.your_collection then
		for k, v in pairs(G.your_collection) do
			if
				self.area == v
				and G.ACTIVE_MOD_UI
			then
				print(self.config.center)
				UNCARDABLE.gameset_config_ui(self.config.center)
			end
		end
	end
end

function UNCARDABLE.gameset_config_ui(center)
	print(center.key)
	G.SETTINGS.paused = true
	G.your_collection = {}
	G.your_collection[1] = CardArea(
		G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2,
		G.ROOM.T.h,
		5.3 * G.CARD_W,
		1.03 * G.CARD_H,
		{ card_limit = 5, type = "title", highlight_limit = 0, collection = true }
	)
	local deck_tables = {
		n = G.UIT.R,
		config = { align = "cm", padding = 0, no_fill = true },
		nodes = {
			{ n = G.UIT.O, config = { object = G.your_collection[1]}},
		},
	}

	local skins = {}
	skins[#skins+1] = G.UNCARDABLE_jokers1[center.key]
	if G.UNCARDABLE_jokers2[center.key] ~= nil then
		skins[#skins+1] = G.UNCARDABLE_jokers2[center.key]
	end
	--print(skins[1].pos, skins[2])
	for i = 1, #skins do
		print(skins[i].pos, "uncardable_agglomeration"..i, skins[i].artist[1])
		local dummycenter = UNCARDABLE.deep_copy(center)
		print(dummycenter.key)
		local card = Card(G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.y, G.CARD_W, G.CARD_H, nil, dummycenter)
		
		card.children.center.atlas = G.ASSET_ATLAS["uncardable_agglomeration"..i]
		card.children.center:set_sprite_pos({x = skins[i].pos, y = 0})
		local obj = card.config.center or (card.config.tag and G.P_TAGS[card.config.tag.key])
		obj.artist_credits = skins[i].artist
		G.your_collection[1]:emplace(card)

	end
	for i = 1, #skins do --add buttons
		
	end
	INIT_COLLECTION_CARD_ALERTS()
	local args = {
		back_func = G.uncard_prev_collec,
		contents = {
			{
				n = G.UIT.R,
				config = {align = "cm", minw = 2.0, padding = 0.1, r = 0.1, colour = G.C.BLACK, emboss = 0.05},
				nodes = { deck_tables},
			},
		},	
	}
	local configbox = create_UIBox_generic_options(args)
	G.FUNCS.overlay_menu({
		definition = configbox,
	})
end

function UNCARDABLE.deep_copy(curr, seen)
	if type(curr) ~= "table" then
		return curr
	end
	if seen and seen[curr] then
		return seen[curr]
	end
	local s = seen or {}
	local res = setmetatable({}, getmetatable(curr))
	s[curr] = res
	for k, v in pairs(curr) do
		res[UNCARDABLE.deep_copy(k, s)] = UNCARDABLE.deep_copy(v, s)
	end
	return res
end