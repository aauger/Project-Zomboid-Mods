-- They're Just Sick -20
-- Certified Moron -20
-- Verbal Diarrhea -8
-- ???

local function doVerbalDiarrhea()
    local RAND_CHANCE = 10;

    local player = getPlayer();
    if player:HasTrait("VerbalDiarrhea") and player:isCanShout() and
        ZombRand(RAND_CHANCE) == 0 then
        local INTENSITY = 30;
        local UTTERANCE_REFS = {
            "IGUI_TTT_trait_vd_ut1", "IGUI_TTT_trait_vd_ut2",
            "IGUI_TTT_trait_vd_ut3", "IGUI_TTT_trait_vd_ut4"
        };

        local message = getText(UTTERANCE_REFS[ZombRand(4) + 1]);

        addSound(player, player:getX(), player:getY(), player:getZ(), INTENSITY,
                 INTENSITY);
        player:SayShout(message);
        player:playEmote("shout");
    end
end

local function doAmaxophobia()
    local player = getPlayer();
    local vehicle = player:getVehicle();

    if player:HasTrait("Amaxophobia") and vehicle ~= nil then
        if player:getStats():getPanic() < 100.0 then
            player:getStats():setPanic(math.min(
                                           player:getStats():getPanic() + 10.0,
                                           100.0));
        end

        if player:getStats():getPanic() >= 90.0 then
            local exitVehicleChance = ZombRand(10);
            if (exitVehicleChance == 0) then
                vehicle:exitVehicle(player);
            end
        end
    end
end

Events.EveryTenMinutes.Add(doVerbalDiarrhea);
Events.EveryOneMinute.Add(doAmaxophobia);
