local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local KeySystem = {}

function KeySystem:GetHWID(method)
    if method == "RandomGUID" then
        return HttpService:GenerateGUID(false)
    else
        return tostring(Players.LocalPlayer.UserId)
    end
end

function KeySystem:Validate(config, callback)
    if not config.UseKeySystem then
        callback(true)
        return
    end

    local hwid = self:GetHWID(config.KeySystem.HWIDMethod)
    local apiURL = config.KeySystem.APIEndpoint .. hwid

    -- Hiển thị GUI nhập key và xử lý xác minh tại đây
    -- Nếu xác minh thành công, gọi callback(true)
    -- Nếu thất bại, gọi callback(false)
end

return KeySystem
