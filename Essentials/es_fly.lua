function EsHandleFlyCommand( Split, Player )
	local PlayerFly = function(OtherPlayer)
		if (OtherPlayer:GetName() == Split[2]) then
            if(Player:HasPermission("es.feed.other")) then
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
            else
                Player:SendMessageFailure( "You don\'t have the permission to do that!" )
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
        cRoot:Get():FindAndDoWithPlayer(Split[2], PlayerFly);
        return true;
        else
            Player:SendMessageFailure("You dont\´t have the permission to do that!")
        end
    end
    return true
end

function EsHandleFlyspeedCommand( Split, Player )
	local PlayerFlyspeed = function(OtherPlayer)
        OtherPlayer:SetFlyingMaxSpeed(Split[3])
        if(OtherPlyer:GetName() == Player:GetName()) then
            Player:SendMessageSuccess("Your max fly speed is now " .. Split[3])
        else
            Player:SendMessageSuccess( OtherPlyer:GetName() .. "\' max fly speed is now " .. Split[3])
            OtherPlyer:SendMessageSuccess("Your max fly speed is now " .. Split[3])
        end
        if not(foundplayer) then
            Player:SendMessageFailure( "Player not found!" )
            return true
        end
    end
    if((Split[3] ~= nil)) then
        if Player:HasPermission("es.speed.fly.other") then
        cRoot:Get():FindAndDoWithPlayer(Split[2], PlayerFlyspeed);
        return true;
        else
            Player:SendMessageFailure("You dont\´t have the permission to do that!")
        return true;
        end
    elseif((Split[2] ~= nil)) then
            Player:SetFlyingMaxSpeed(Split[2])
            Player:SendMessageSuccess("Your max fly speed is now " .. Split[2])
    end
    return true
end