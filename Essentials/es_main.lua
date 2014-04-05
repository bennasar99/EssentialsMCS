PLUGIN = nil

function Initialize(Plugin)
	Plugin:SetName("Essentials")
	Plugin:SetVersion(1)
	
	-- Hooks
	
	PLUGIN = Plugin -- NOTE: only needed if you want OnDisable() to use GetName() or something like that
	
	-- Command Bindings
 	cPluginManager.BindCommand("/burn", "es.burn", EsHandleBurnCommand, " ~ burn a player")
	cPluginManager.BindCommand("/fly", "es.fly", EsHandleFlyCommand, " ~ allows/disallow a player to fly")
	cPluginManager.BindCommand("/feed", "es.feed", EsHandleFeedCommand, " ~ feed a player")
	cPluginManager.BindCommand("/flyspeed", "es.speed.fly", EsHandleFlyspeedCommand, " ~ allows/disallow a player to fly")
	cPluginManager.BindCommand("/heal", "es.heal", EsHandleHealCommand, " ~ heal a player")
    
	LOG("Initialised " .. Plugin:GetName() .. " v." .. Plugin:GetVersion())
	return true
end

function OnDisable()
	LOG(PLUGIN:GetName() .. " is shutting down...")
end