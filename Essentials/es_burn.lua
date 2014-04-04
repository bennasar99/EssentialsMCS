function EsHandleBurnCommand( Split, Player )

	if (Split[3] == nil) then
		Player:SendMessageInfo("Usage: /burn [player] [seconds]")
		return true
	end

	local IsBurning = false;
	local BurnPlayer = function(OtherPlayer)
		if (OtherPlayer:GetName() == Split[2]) then
				OtherPlayer:StartBurning(Split[3] * 19.8)
				IsBurning = true
		end
	end

	cRoot:Get():FindAndDoWithPlayer(Split[2], BurnPlayer);
	if (IsBurning) then
		Player:SendMessageSuccess( "Player " .. Split[2] .. " is burning" )
		return true
	else
		Player:SendMessageFailure( "Player not found" )
		return true
	end

end