TTTBaseGameCharacterDetails = {};

TTTBaseGameCharacterDetails.DoTraits = function()
    local traitVerbalDiarrhea = TraitFactory.addTrait("VerbalDiarrhea",
                                                      getText(
                                                          "UI_TTT_trait_verbaldiarrhea"),
                                                      -8, getText(
                                                          "UI_TTT_trait_verbaldiarrheadesc"),
                                                      false);

    local traitAmaxophobia = TraitFactory.addTrait("Amaxophobia", getText(
                                                       "UI_TTT_trait_amaxophobia"),
                                                   -20, getText(
                                                       "UI_TTT_trait_amaxophobiadesc"),
                                                   false);
end

Events.OnGameBoot.Add(TTTBaseGameCharacterDetails.DoTraits);
