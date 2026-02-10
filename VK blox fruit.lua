--================ AUTO FLAGS =================
local Auto = {
    FarmLevel = false,
    FarmBone = false,
    FarmCake = false,
    Stack = false,

    SeaEvent = false,
    SeaBeast = false,
    Volcano = false,

    PullMob = true,
    Dodge = true,
}

--================ TOGGLE GẮN VÀO UI =================
FarmTab:CreateToggle({Name="Farm Level 1-2800",Callback=function(v)Auto.FarmLevel=v end})
FarmTab:CreateToggle({Name="Farm Bone",Callback=function(v)Auto.FarmBone=v end})
FarmTab:CreateToggle({Name="Farm Cake",Callback=function(v)Auto.FarmCake=v end})

StackFarmTab:CreateToggle({Name="Stack Material",Callback=function(v)Auto.Stack=v end})

SeaEventTab:CreateToggle({Name="Sea Event (ALL)",Callback=function(v)Auto.SeaEvent=v end})
SeaEventTab:CreateToggle({Name="Sea Beast",Callback=function(v)Auto.SeaBeast=v end})
SeaEventTab:CreateToggle({Name="Volcano",Callback=function(v)Auto.Volcano=v end})

--================ HÀM PHỤ =================
local function GetNearestMob()
    local target,dist
    for _,v in pairs(workspace.Enemies:GetChildren()) do
        if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
            local d = (lp.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
            if not dist or d < dist then
                dist = d
                target = v
            end
        end
    end
    return target
end

local function Attack()
    local vu = game:GetService("VirtualUser")
    vu:Button1Down(Vector2.new(),workspace.CurrentCamera.CFrame)
    task.wait()
    vu:Button1Up(Vector2.new(),workspace.CurrentCamera.CFrame)
end

--================ ENGINE DUY NHẤT =================
task.spawn(function()
    while task.wait(0.15) do
        if not lp.Character or not lp.Character:FindFirstChild("HumanoidRootPart") then continue end
        local hrp = lp.Character.HumanoidRootPart

        local mob = GetNearestMob()

        --=========== FARM LEVEL / BONE / CAKE ===========
        if (Auto.FarmLevel or Auto.FarmBone or Auto.FarmCake) and mob then
            -- gom quái
            if Auto.PullMob then
                for _,v in pairs(workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") then
                        v.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame
                        v.HumanoidRootPart.CanCollide = false
                    end
                end
            end

            -- né đòn
            if Auto.Dodge then
                hrp.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(math.random(-6,6),15,math.random(-6,6))
            else
                hrp.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0,15,0)
            end

            Attack()
        end

        --=========== STACK FARM ===========
        if Auto.Stack then
            if Sea == 2 then
                -- vật chất kì dị / nước mắt
            elseif Sea == 3 then
                -- sắt vụn / vảy rồng / ember / đuôi cá
            end
        end

        --=========== SEA EVENT ===========
        if Auto.SeaEvent then
            -- auto lái thuyền basic
            if Auto.SeaBeast and mob then
                hrp.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0,25,0)
                Attack()
            end

            if Auto.Volcano then
                -- xử lý event núi lửa
            end
        end
    end
end)
