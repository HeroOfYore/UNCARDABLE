

   SMODS.Blind:take_ownership('bl_needle', {
        loc_txt = {name = "Poco and Apoco"},
        boss_colour = HEX("CE2DE9"),
        }, true)

   SMODS.Blind:take_ownership('bl_wall', {
      loc_txt = {name = "{C:mult}Amogus{}"},
      boss_colour = HEX("FFFFBB"),
   }, true)

   SMODS.PokerHand:take_ownership('Straight',
   {
      example = {
         {'S_Q', true},
         {'S_J', true},
         {'H_T', true},
         {'C_9', true},
         {'D_8', true},
      },
   }, true)

   SMODS.PokerHand:take_ownership('Pair',
   {
      modify_display_text = function(self, _cards, scoring_hand)
         local queens = true;
         for j = 1, #scoring_hand do 
            local rank = SMODS.Ranks[scoring_hand[j].base.value]
            queens = rank and queens and (rank.key == "Queen")
         end
         if queens then
            return self.key .. ' Yuri'
         end
      end
   }, true)