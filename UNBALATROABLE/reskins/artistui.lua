loc_colour("red")
G.ARGS.LOC_COLOURS['heroofyore'] = HEX('7B2F2B')
G.ARGS.LOC_COLOURS['ermywurm'] = HEX('CBA334')

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