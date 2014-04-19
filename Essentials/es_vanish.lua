function EsHandleVanishCommand( Split, Player )
 	if (Split[2] == nil) then
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
 		if (OtherPlayer:GetName() == Split[2]) and (OtherPlayer:GetName() ~= Player:GetName()) then
            if OtherPlayer:IsVisible() == true then
                OtherPlayer:SetVisible(false)
                OtherPlayer:SendMessageInfo("You're now invisible!")
                IsVisible = 0
            else
                OtherPlayer:SetVisible(true)
                OtherPlayer:SendMessageInfo("You're now visible!")
                IsVisible = 1
            end
            return true
 	    end
 	end
    if(Player:HasPermission("es.vanish.other")) then
        cRoot:Get():FindAndDoWithPlayer(Split[2], VanishPlayer);
        if (IsVisible == 0) then
            Player:SendMessageSuccess( "Player " .. Split[2] .. " is now invisible" )
            return true
        elseif (IsVisible == 1) then
            Player:SendMessageSuccess( "Player " .. Split[2] .. " is now visible" )
            return true        
        else
            Player:SendMessageFailure( "Player not found" )
            return true
        end
    end
end
