PLUGIN = nil

function Initialize(Plugin)
	Plugin:SetName("Essentials")
	Plugin:SetVersion(1)
	
	-- Hooks
	
	PLUGIN = Plugin -- NOTE: only needed if you want OnDisable() to use GetName() or something like that
	
	-- Command Bindings
	cPluginManager.BindCommand("/heal", "es.heal", EsHandleHeal, " ~ Heals a player")
    
	LOG("Initialised " .. Plugin:GetName() .. " v." .. Plugin:GetVersion())
	return true
end

function OnDisable()
	LOG(PLUGIN:GetName() .. " is shutting down...")
end