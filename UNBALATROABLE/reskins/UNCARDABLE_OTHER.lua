

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
            local suit = scoring_hand[j].base.suit
            queens = rank and queens and (rank.key == "Queen" or suit == "Hearts" and rank.key == "King" or suit  == "Spades" and rank.key == "King" or suit == "Diamonds" and rank.key == "King")
         end
         if queens then
            return self.key .. ' Yuri'
         end
      end
   }, true)

   SMODS.PokerHand:take_ownership('Two Pair', 
   {
      modify_display_text = function(self, _cards, scoring_hand)
         local women = true;
         for j = 1, #scoring_hand do
            local rank = SMODS.Ranks[scoring_hand[j].base.value]
            local suit = scoring_hand[j].base.suit
            women = rank and women and (rank.key == "Queen" or suit == "Hearts" and rank.key == "King" or suit  == "Spades" and rank.key == "King" or suit == "Diamonds" and rank.key == "King")
         end
         if women then
            return self.key .. ' Yuri'
         end
      end
   }, true)

   SMODS.PokerHand:take_ownership('Three of a Kind', {
      modify_display_text = function(self, _cards, scoring_hand)
         local women = true;
         for j = 1, #scoring_hand do
            local rank = SMODS.Ranks[scoring_hand[j].base.value]
            local suit = scoring_hand[j].base.suit
            women = rank and women and (rank.key == "Queen" or suit == "Hearts" and rank.key == "King" or suit  == "Spades" and rank.key == "King" or suit == "Diamonds" and rank.key == "King")
         end
         if women then
            return self.key .. ' Yuri'
         end
      end
   }, true)

   SMODS.PokerHand:take_ownership('Four of a Kind', {
      modify_display_text = function(self, _cards, scoring_hand)
         local women = true;
         for j = 1, #scoring_hand do
            local rank = SMODS.Ranks[scoring_hand[j].base.value]
            local suit = scoring_hand[j].base.suit
            women = rank and women and (rank.key == "Queen" or suit ~= "Clubs" and rank.key == "King") 
         end
         if women then
            return self.key .. ' Yuri'
         end
      end
   }, true)

   SMODS.PokerHand:take_ownership('High Card', {
      modify_display_text = function(self, _cards, scoring_hand)
         local women = true;
         for j = 1, #scoring_hand do
            local rank = SMODS.Ranks[scoring_hand[j].base.value]
            local suit = scoring_hand[j].base.suit
            women = rank and women and (rank.key == "Jack" and suit == "Spades")
         end
         if women then
            return self.key .. ' Octave'
         end
      end
   }, true)

   if UNCARDABLE.config.chipispis then

   end

