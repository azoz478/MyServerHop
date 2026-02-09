while true do
    task.wait(20) -- تم التعديل لـ 20 ثانية
    local ts = game:GetService("TeleportService")
    ts:Teleport(game.PlaceId, game.Players.LocalPlayer)
end
