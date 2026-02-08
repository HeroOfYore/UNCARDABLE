loc_colour("red")
G.C.yore = SMODS.Gradient {
    key = "YORE",
    colours = { HEX("AAFFBB"), HEX("DDDDDD") }
}
G.C.stanza = SMODS.Gradient {
    key = "STANZA",
    colours = { HEX("F9EED0"), HEX('6DD3E2')}
}
G.C.bramble = SMODS.Gradient {
    key = "BRAMBLE",
    colours = {HEX("FFFFFF"), HEX('992D22')}
}
G.C.birb = SMODS.Gradient {
    key = "BIRB",
    colours = {HEX("1A0823"), HEX('95879D')}
}
G.ARGS.LOC_COLOURS['heroofyore'] = G.C.yore
G.ARGS.LOC_COLOURS['ermywurm'] = HEX('AD7193')
G.ARGS.LOC_COLOURS['guac'] = HEX('F394FF')
G.ARGS.LOC_COLOURS['ploutre'] = HEX('AAAAAA')
G.ARGS.LOC_COLOURS['sonata'] = HEX('FF004A')
G.ARGS.LOC_COLOURS['mcres'] = HEX('2F11BA')
G.ARGS.LOC_COLOURS['stanza'] = G.C.stanza
G.ARGS.LOC_COLOURS['objitude'] = HEX('FFAABB')
G.ARGS.LOC_COLOURS['murdock'] = HEX('AC23BD')
G.ARGS.LOC_COLOURS['8z'] = HEX('506385')
G.ARGS.LOC_COLOURS['bramble'] = G.C.bramble
G.ARGS.LOC_COLOURS['birb'] = G.C.birb
G.ARGS.LOC_COLOURS['epicjeong'] = HEX('15b159')

function UNCARDABLE_artist_tooltip(_c, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    localize{type = 'descriptions', set = 'UNCARDABLE Artist', key = _c.key, nodes = desc_nodes, vars = specific_vars or _c.vars}
    desc_nodes['colour'] = G.ARGS.LOC_COLOURS[_c.key] or G.C.GREY
    desc_nodes.uncardable_artist = true
    desc_nodes.title = _c.title or localize('UNCARDABLE_artist')
end

local itfr = info_tip_from_rows
function info_tip_from_rows(desc_nodes, name)
    if desc_nodes.uncardable_artist then
        local t = {}
        for k, v in ipairs(desc_nodes) do
            t[#t+1] = {n=G.UIT.R, config={align = "cm"}, nodes=v}
        end
        return {n=G.UIT.R, config={align = "cm", colour = darken(desc_nodes.colour, 0.15), r = 0.1}, nodes={
            {n=G.UIT.R, config={align = "tm", minh = 0.36, padding = 0.03}, nodes={{n=G.UIT.T, config={text = desc_nodes.title, scale = 0.32, colour = G.C.UI.TEXT_LIGHT}}}},
            {n=G.UIT.R, config={align = "cm", minw = 1.5, minh = 0.4, r = 0.1, padding = 0.05, colour = lighten(desc_nodes.colour, 0.5)}, nodes={{n=G.UIT.R, config={align = "cm", padding = 0.03}, nodes=t}}}
        }}
    elseif desc_nodes.tag then
        local t = {}
        for k, v in ipairs(desc_nodes) do
            t[#t+1] = {n=G.UIT.R, config={align = "cm"}, nodes=v}
        end
        return {n=G.UIT.R, config={align = "cm", colour = lighten(G.C.GREY, 0.15), r = 0.1}, nodes={
            {n=G.UIT.R, config={align = "tm", minh = 0.36, padding = 0.03}, nodes={{n=G.UIT.T, config={text = desc_nodes.title, scale = 0.32, colour = G.C.UI.TEXT_LIGHT}}}},
            {n=G.UIT.R, config={align = "cm", minw = 1.5, minh = 0.4, r = 0.1, padding = 0.05, colour = G.C.WHITE}, nodes={{n=G.UIT.R, config={align = "cm", padding = 0.03}, nodes=t}}}
        }}
    else
        return itfr(desc_nodes, name)
    end
end


local UNCARDABLE_gui_popup = G.UIDEF.card_h_popup
function G.UIDEF.card_h_popup(card)
    local ret_val = UNCARDABLE_gui_popup(card)
    local AUT = card.ability_UIBox_table
    local obj = card.config.center or (card.config.tag and G.P_TAGS[card.config.tag.key])
    if card.area and card.area.config.collection and not card.config.center.discovered then return ret_val end
    if obj and obj.artist_credits then
        table.insert(ret_val.nodes[1].nodes[1].nodes[1].nodes, artist_node(obj.artist_credits, localize('uncardable_art_credit')))
    end

    return ret_val
end

function artist_node(artists, first_string)
    local artist_node = {n = G.UIT.R, config = {align = 'tm'}, nodes = {
        {n =G.UIT.T, config= {
            text = first_string, 
            shadow = true, 
            colour = G.C.UI.BACKGROUND_WHITE,
            scale = 0.27}}
    }}
    local total_artists = #artists
    for i, artist in ipairs(artists) do
        if total_artists > 1 and i > 1 then
            if i == total_artists then
                table.insert(artist_node.nodes,
                    {n=G.UIT.T, config ={
                    text = localize('uncardable_and'),
                    shadow = true,
                    colour = G.C.WHITE,
                    scale = 0.27}}
                )
            else
                table.insert(artist_node.nodes,
                {n=G.UIT.T, config = {
                text = ', ',
                shadow = true,
                colour = G.C.WHITE,
                scale = 0.27}}
                )
            end
        end
    table.insert(artist_node.nodes,
            {n=G.UIT.O, config={
                object = DynaText({string = localize{type = 'raw_descriptions', set = 'UNCARDABLE Artist', key = artist},
                colours = {G.ARGS.LOC_COLOURS[artist] or G.C.WHITE},
                bump = true,
                silent = true,
                pop_in = 0,
                pop_in_rate = 4,
                shadow = true,
                y_offset = -0.6,
                scale = 0.27
                })
            }}
        )
    end
    return artist_node
end