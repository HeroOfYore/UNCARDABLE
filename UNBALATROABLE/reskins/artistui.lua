loc_colour("red")
G.ARGS.LOC_COLOURS['heroofyore'] = HEX('7B2F2B')
G.ARGS.LOC_COLOURS['ermywurm'] = HEX('CBA334')

function UNCARDABLE_artist_tooltip(_c, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    localize{type = 'descriptions', set = 'UNCARDABLE Artist', key = _c.key, nodes = desc_nodes, vars = specific_vars or _c.vars}
    desc_nodes['colour'] = G.ARGS.LOC_COLOURS[_c.key] or G.C.GREY
    desc_nodes.uncardable_artist = true
    desc_nodes.title = _c.title or localize('UNCARDABLE_artist')
end

