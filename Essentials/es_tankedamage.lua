function EsOnTakeDamage(Receiver, TYPE)
    if(Receiver:IsPlayer()) then
        if(true and TYPE:DamageType("dtFalling")) then
        return false
        end
    end
    return true;
end