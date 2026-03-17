

local base_ease_dollars = ease_dollars
function ease_dollars(mod, x)
        base_ease_dollars(mod, x)

        SMODS.calculate_context({uncardable_ease_dollars = mod})

end