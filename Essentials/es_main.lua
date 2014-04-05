PLUGIN = nil

function Initialize(Plugin)
	Plugin:SetName("Essentials")
	Plugin:SetVersion(1)
	
	-- Hooks
	
	PLUGIN = Plugin -- NOTE: only needed if you want OnDisable() to use GetName() or something like that
	
	-- Command Bindings
	cPluginManager.BindCommand("/heal", "es.heal", EsHandleHealCommand, " ~ Heals a player")
	cPluginManager.BindCommand("/fly", "es.fly", EsHandleFlyCommand, " ~ allows/disallow a player to fly")
	cPluginManager.BindCommand("/flyspeed", "es.flyspeed", EsHandleFlyspeedCommand, " ~ allows/disallow a player to fly")
    
	LOG("Initialised " .. Plugin:GetName() .. " v." .. Plugin:GetVersion())
	return true
end

function OnDisable()
	LOG(PLUGIN:GetName() .. " is shutting down...")
end