function EsHandleRepairCommand(Split, Player)
        HoldedItem = Player:GetEquippedItem()
    if(HoldedItem:IsDamageable()) then
        HoldedItem.m_ItemDamage = 0
        Player:GetInventory():SetHotbarSlot(Player:GetInventory():GetEquippedSlotNum(), HoldedItem)
        Player:SendMessageSuccess("Item repaired")
        return true
    else
        Player:SendMessageFailure("Please hold an item to repair")
        return true
    end
    return true
end
