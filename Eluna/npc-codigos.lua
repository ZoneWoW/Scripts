local npcId = 197

t = {}
	--t[ID de objeto de recompensa] = "clave para conseguirlo"
	t[25] = "2504" --Espada corta desgastada
	t[42153] = "wasamagra" --Ojo de dragon fracturado
	
local function GossipHello(event, plr, unit)
    plr:GossipMenuAddItem(0, "Me gustaria intentar averiguar un codigo", 0, 1, true, "Probar un codigo te costara la siguiente cantidad de dinero:", 10000)
    plr:GossipSendMenu(1, unit)
end

local function GossipSelect(event, player, creature, sender, intid, code)
    if (intid == 1) then
        player:ModifyMoney(-10000)
	for i,v in pairs(t) do
		if code == v then
			player:SendBroadcastMessage("Codigo correcto!")
			player:AddItem(i, "1")
			break
		end
	end
    end
end

RegisterCreatureGossipEvent(npcId, 1, GossipHello)
RegisterCreatureGossipEvent(npcId, 2, GossipSelect)
