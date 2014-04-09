function EsHandleRepairCommand(Split, Player)
        HoldedItem = Player:GetEquippedItem()
    if(HoldedItem:IsDamageable()) then
        Item:DamageItem(HoldedItem, (HoldedItem.m_ItemDamage - HoldedItem:GetMaxDamage()))
        Player:SendMessageSuccess("item repaired")
        return true
    else
        Player:SendMessageFailure("please hold an item to repair")
        return true
    end
    return true
end