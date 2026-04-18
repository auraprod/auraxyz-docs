local game = GetDatamodel()
local Players = game and game:FindFirstChildOfClass("Players") or nil
local Workspace = workspace or (game and game:FindFirstChild("Workspace")) or (game and game:FindFirstChildOfClass("Workspace"))
local Camera = Workspace and Workspace:FindFirstChild("Camera") or nil

local espObjects = {}

local function CleanupESP()
    local currentPlayers = {}
    if Players then
        for _, p in pairs(Players:GetChildren()) do
            local name = p:Name()
            if name then currentPlayers[name] = true end
        end
    end
    
    for playerName, objs in pairs(espObjects) do
        if not currentPlayers[playerName] then
            if objs.Box then objs.Box:Remove() end
            if objs.Name then objs.Name:Remove() end
            if objs.Distance then objs.Distance:Remove() end
            if objs.Health then objs.Health:Remove() end
            espObjects[playerName] = nil
        end
    end
end

while true do
    if not game then 
        game = GetDatamodel() 
    end
    
    if game and not Players then 
        Players = game:FindFirstChildOfClass("Players") 
    end
    
    if game and not Workspace then 
        Workspace = workspace or game:FindFirstChild("Workspace") or game:FindFirstChildOfClass("Workspace") 
    end
    
    if Workspace and not Camera then 
        Camera = Workspace:FindFirstChild("Camera") 
    end
    
    if Players and Camera then
        CleanupESP()
        
        local myPos = nil
        local camCFrame = Camera:GetCFrame()
        if camCFrame and camCFrame.Position then
            myPos = camCFrame.Position
        end

        local allPlayers = Players:GetChildren()
        for _, player in pairs(allPlayers) do
            local playerName = player:Name()
            if playerName then
                if not espObjects[playerName] then
                    espObjects[playerName] = {
                        Box = Drawing.new("Square"),
                        Name = Drawing.new("Text"),
                        Distance = Drawing.new("Text"),
                        Health = Drawing.new("Text")
                    }
                    
                    espObjects[playerName].Box.Color = {1, 0, 0}
                    espObjects[playerName].Box.Thickness = 1.5
                    espObjects[playerName].Box.Filled = false
                    
                    espObjects[playerName].Name.Color = {1, 1, 1}
                    espObjects[playerName].Name.Size = 16
                    espObjects[playerName].Name.Center = true
                    espObjects[playerName].Name.Outline = true
                    
                    espObjects[playerName].Distance.Color = {1, 1, 0}
                    espObjects[playerName].Distance.Size = 14
                    espObjects[playerName].Distance.Center = true
                    espObjects[playerName].Distance.Outline = true
                    
                    espObjects[playerName].Health.Color = {0, 1, 0}
                    espObjects[playerName].Health.Size = 14
                    espObjects[playerName].Health.Center = true
                    espObjects[playerName].Health.Outline = true
                end
                
                local objs = espObjects[playerName]
                local char = player:Character()
                local root = char and char:FindFirstChild("HumanoidRootPart")
                local head = char and char:FindFirstChild("Head")
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                
                local hp = hum and hum:Health() or 100
                local maxHp = hum and hum:MaxHealth() or 100
                
                local isAlive = (hp > 0) or (char and root and head)
                
                if char and root and head and isAlive then
                    local rootPos = root:GetPosition()
                    local headPos = head:GetPosition()
                    
                    if rootPos and headPos then
                        local dist = 0
                        if myPos then
                            local dx = rootPos.X - myPos.X
                            local dy = rootPos.Y - myPos.Y
                            local dz = rootPos.Z - myPos.Z
                            dist = math.floor(math.sqrt(dx*dx + dy*dy + dz*dz))
                        end
                        
                        if dist > 2 then
                            local topPos = {X = headPos.X, Y = headPos.Y + 1.5, Z = headPos.Z}
                            local bottomPos = {X = rootPos.X, Y = rootPos.Y - 3.5, Z = rootPos.Z}
                            
                            local topScreen, onScreenTop = Drawing.WorldToScreen(topPos)
                            local botScreen, onScreenBot = Drawing.WorldToScreen(bottomPos)
                            
                            if onScreenTop and onScreenBot then
                                local topX, topY = topScreen.X, topScreen.Y
                                local botX, botY = botScreen.X, botScreen.Y
                                
                                local height = botY - topY
                                local width = height / 2
                                
                                objs.Box.Visible = true
                                objs.Box.Position = {X = topX - width / 2, Y = topY}
                                objs.Box.Size = {X = width, Y = height}
                                
                                objs.Name.Visible = true
                                objs.Name.Text = player:Name()
                                objs.Name.Position = {X = topX, Y = topY - 18}
                                
                                objs.Health.Visible = true
                                objs.Health.Text = tostring(math.floor(hp)) .. " HP"
                                
                                local hpPct = (maxHp > 0) and math.max(0, math.min(1, hp / maxHp)) or 1
                                objs.Health.Color = {1 - hpPct, hpPct, 0}
                                objs.Health.Position = {X = topX - width / 2 - 20, Y = topY}
                                
                                objs.Distance.Visible = true
                                objs.Distance.Text = tostring(dist) .. " studs"
                                objs.Distance.Position = {X = topX, Y = botY + 4}
                            else
                                objs.Box.Visible = false
                                objs.Name.Visible = false
                                objs.Distance.Visible = false
                                objs.Health.Visible = false
                            end
                        else
                            objs.Box.Visible = false
                            objs.Name.Visible = false
                            objs.Distance.Visible = false
                            objs.Health.Visible = false
                        end
                    else
                        objs.Box.Visible = false
                        objs.Name.Visible = false
                        objs.Distance.Visible = false
                        objs.Health.Visible = false
                    end
                else
                    objs.Box.Visible = false
                    objs.Name.Visible = false
                    objs.Distance.Visible = false
                    objs.Health.Visible = false
                end
            end
        end
    end
    
    wait(0.01)
end