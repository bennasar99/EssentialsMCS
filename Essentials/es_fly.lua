function EsHandleFlyCommand( Split, Player )
	local HealPlayer = function(OtherPlayer)
		if (OtherPlayer:GetName() == Split[2]) then
            if not(OtherPlayer:CanFly())then
                OtherPlayer:SetCanFly(true)
                if not(OtherPlayer:GetName() == Player:GetName()) then
                Player:SendMessageSuccess( OtherPlayer:GetName() ..  " can fly now" )
                end
                OtherPlayer:SendMessageSuccess( "You can fly now" )
                return true;
            else
                OtherPlayer:SetCanFly(false)
                OtherPlayer:SetFlying(false)
                if not(OtherPlayer:GetName() == Player:GetName()) then
                Player:SendMessageSuccess( OtherPlayer:GetName() ..  " can\'t fly any longer" )
                end
                OtherPlayer:SendMessageSuccess( "You can\'t fly any longer" )
                return true;
            end
            if not(foundplayer) then
                Player:SendMessageFailure( "Player not found!" )
                return true
            end
		end
	end
    if(Split[2] == nil) then
        if not(Player:CanFly())then
            Player:SetCanFly(true)
            Player:SendMessageSuccess( "You can fly now")
            return true;
        else
            Player:SetCanFly(false)
            Player:SetFlying(false)
            Player:SendMessageSuccess( "You can\'t fly any longer")
            return true;
        end
        return true;
    else
        if Player:HasPermission("es.heal.other") then
        cRoot:Get():FindAndDoWithPlayer(Split[2], HealPlayer);
        return true;
        else
            Player:SendMessageFailure("You dont\´t have the permission to do that!")
        end
    end
    return true
end