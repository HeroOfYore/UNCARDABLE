
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

local function get_isp_number()
   local random_num_of_isp = math.random(0, 7)
   local stringisp = ""
   for j = 1, random_num_of_isp do
      stringisp = stringisp .. "isp"
   end
   return stringisp
end
      

   if UNCARDABLE.config.chipispis then
      print("REPLACING")
      if UNCARDABLE.config.chipsispis_overload then
         function SMODS.current_mod.process_loc_text()
            --print("TWICE")
            G.localization.descriptions.Edition.e_foil.text[1] = string.gsub(G.localization.descriptions.Edition.e_foil.text[1], " chips", " chipispis")
            G.localization.descriptions.Blind.bl_flint.text[1] = string.gsub(G.localization.descriptions.Blind.bl_flint.text[1], " Chips", " Chipispis")
            G.localization.descriptions.Back.b_plasma.text[1] = string.gsub(G.localization.descriptions.Back.b_plasma.text[1], "Chips", "Chipispis")
            for pos, locstring in pairs(G.localization.descriptions.Joker) do
               --print(locstring)
               --print(pos)
               for text, lstring in pairs(G.localization.descriptions.Joker[pos].text) do
                  local ispis = "chip" .. get_isp_number() .. "is"
                  G.localization.descriptions.Joker[pos].text[text] = string.gsub(lstring, "Chips", ispis)
               end
            end
            for pos, locstring in pairs(G.localization.descriptions.Planet) do
               for text, lstring in pairs(G.localization.descriptions.Planet[pos].text) do
                  local ispis = " chip" .. get_isp_number() .. "is"

                  G.localization.descriptions.Planet[pos].text[text] = string.gsub(lstring, " chips", ispis)
               end
            end 
            for pos, locstring in pairs(G.localization.descriptions.Other) do
               for text, lstring in pairs(G.localization.descriptions.Other[pos].text) do
                  local ispis = " chip" .. get_isp_number() .. "is"

                    G.localization.descriptions.Other[pos].text[text] = string.gsub(lstring, " chips", ispis)
               end
            end 
         end
      else
         function SMODS.current_mod.process_loc_text()
            --print("TWICE")
            G.localization.descriptions.Edition.e_foil.text[1] = string.gsub(G.localization.descriptions.Edition.e_foil.text[1], " chips", " chipispis")
            G.localization.descriptions.Blind.bl_flint.text[1] = string.gsub(G.localization.descriptions.Blind.bl_flint.text[1], " Chips", " Chipispis")
            G.localization.descriptions.Back.b_plasma.text[1] = string.gsub(G.localization.descriptions.Back.b_plasma.text[1], "Chips", "Chipispis")
            for pos, locstring in pairs(G.localization.descriptions.Joker) do
               --print(locstring)
               --print(pos)
               for text, lstring in pairs(G.localization.descriptions.Joker[pos].text) do
                  G.localization.descriptions.Joker[pos].text[text] = string.gsub(lstring, "Chips", "chipispis")
               end
            end
            for pos, locstring in pairs(G.localization.descriptions.Planet) do
               for text, lstring in pairs(G.localization.descriptions.Planet[pos].text) do
                  G.localization.descriptions.Planet[pos].text[text] = string.gsub(lstring, " chips", " chipispis")
               end
            end 
            for pos, locstring in pairs(G.localization.descriptions.Other) do
               for text, lstring in pairs(G.localization.descriptions.Other[pos].text) do
                    G.localization.descriptions.Other[pos].text[text] = string.gsub(lstring, " chips", " chipispis")
               end
            end 
         end
      end
   end


