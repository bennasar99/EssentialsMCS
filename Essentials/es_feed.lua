function EsHandleFeedCommand( Split, Player )
	local HealPlayer = function(OtherPlayer)
		if (OtherPlayer:GetName() == Split[2]) then
            OtherPlayer:Feed((20-OtherPlayer:GetFoodLevel()),(20-OtherPlayer:GetFoodSaturationLevel()))
            if(OtherPlayer:GetName() == Player:GetName()) then
                Player:SendMessageSuccess( "You feeded yourself!" )
                return true
            else
                Player:SendMessageSuccess( "You feed " .. Split[2])
                OtherPlayer:SendMessageSuccess( "You got feeded!" )
                return true
            end
		end
	end
    if (Split[2] ~= nil) then
        if Player:HasPermission("es.feed.other") then
            cRoot:Get():FindAndDoWithPlayer(Split[2], HealPlayer);
            foundplayer = true
        else
            Player:SendMessageFailure("You dont\´t have the permission to do that!")
        end
    else
        Player:Feed((20-Player:GetFoodLevel()),(20-Player:GetFoodSaturationLevel()))
        Player:SendMessageSuccess( "You feeded yourself!" )
        return true
    end
    if not(foundplayer) then
        Player:SendMessageFailure( "Player not found!" )
        return true
    end
    return true
end