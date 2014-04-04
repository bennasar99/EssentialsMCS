function EsHandleHealCommand( Split, Player )
	local HealPlayer = function(OtherPlayer)
		if (OtherPlayer:GetName() == Split[2]) then
			OtherPlayer:Heal(20-OtherPlayer:GetHealth())
            OtherPlayer:Feed((20-OtherPlayer:GetFoodLevel()),(20-OtherPlayer:GetFoodSaturationLevel()))
            if(OtherPlayer:GetName() == Player:GetName()) then
                Player:SendMessageSuccess( "You healed yourself!" )
                return true
            else
                Player:SendMessageSuccess( "You healed " .. Split[2])
                OtherPlayer:SendMessageSuccess( Player:GetName() .. " healed you" )
                return true
            end
		end
	end
    if (Split[2] ~= nil) then
        if Player:HasPermission("es.heal.other") then
            cRoot:Get():FindAndDoWithPlayer(Split[2], HealPlayer);
            foundplayer = true
        else
            Player:SendMessageFailure("You dont\´t have the permission to do that")
        end
    else
        Player:Heal(20-Player:GetHealth())
        Player:Feed((20-Player:GetFoodLevel()),(20-Player:GetFoodSaturationLevel()))
        Player:SendMessageSuccess( "You healed yourself!" )
        return true
    end
    if not(foundplayer) then
        Player:SendMessageFailure( "Player not found!" )
        return true
    end
    return true
end