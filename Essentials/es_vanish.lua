function EsHandleVanishCommand( Split, Player )
 	if (Split[3] == nil) then
 	    if Player:IsVisible() == true then
            Player:SetVisible(false)
            Player:SendMessageInfo("You're now invisible!")
        else
            Player:SetVisible(true)
            Player:SendMessageInfo("You're now visible!")
        end
 		return true
 	end
 	local IsVisible = false;
 	local VanishPlayer = function(OtherPlayer)
 		if (OtherPlayer:GetName() == Split[2]) then
            if OtherPlayer:IsVisible() == true then
                OtherPlayer:SetVisible(false)
                OtherPlayer:SendMessageInfo("You're now invisible!")
            else
                OtherPlayer:SetVisible(true)
                OtherPlayer:SendMessageInfo("You're now visible!")
            end
            IsVisible = true
            return true
 	    end
 	end
 	cRoot:Get():FindAndDoWithPlayer(Split[2], VanishPlayer);
 	if (IsVisible) then
 		Player:SendMessageSuccess( "Player " .. Split[2] .. " is invisible (or visible if was already invisible)" )
 		return true
 	else
		Player:SendMessageFailure( "Player not found" )
		return true
	end
end
