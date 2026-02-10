repeat task.wait() until game:IsLoaded()

-- ================= SERVICE =================
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local RS = game:GetService("ReplicatedStorage")

-- ================= UI =================
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "NguyenKhang Hub | FULL",
    LoadingTitle = "Blox Fruits",
    LoadingSubtitle = "Farm • Sea • Boss • V4 • Moon",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "NguyenKhangHub",
        FileName = "FullAllInOne"
    }
})

local FarmTab = Window:CreateTab("🌾 Farm", 4483362458)
local SeaTab  = Window:CreateTab("🌊 Sea Event", 4483362458)
local BossTab = Window:CreateTab("👹 Boss", 4483362458)
local V4Tab   = Window:CreateTab("🧬 V4 / Upgrade", 4483362458)
local MoonTab = Window:CreateTab("🌕 Full Moon", 4483362458)
local SetTab  = Window:CreateTab("⚙️ Settings", 4483362458)

-- ================= GLOBAL =================
getgenv().AutoFarm = false
getgenv().FarmBone = false

getgenv().AutoSea = false
getgenv().AutoSeaBeast = false
getgenv().AntiSea = true

getgenv().KillBB = false
getgenv().KillIndra = false
getgenv().KillDough = false

getgenv().AutoV3 = false
getgenv().AutoV4 = false
getgenv().AutoTrial = false

getgenv().HopFullMoon = false

getgenv().Speed = 16
getgenv().Jump = 50
getgenv().Dash = false

-- ================= HELPER =================
local function FlyTo(cf, speed)
    local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local dist = (hrp.Position - cf.Position).Magnitude
    TweenService:Create(
        hrp,
        TweenInfo.new(dist/(speed or 250), Enum.EasingStyle.Linear),
        {CFrame = cf}
    ):Play()
end

local function IsFullMoon()
    return (Lighting.ClockTime >= 18 or Lighting.ClockTime <= 5) and Lighting.Brightness >= 2
end

-- ================= FARM TAB =================
FarmTab:CreateSection("📌 Farm Level / Material")

FarmTab:CreateToggle({
    Name = "Auto Farm Level",
    Callback = function(v) getgenv().AutoFarm = v end
})

FarmTab:CreateToggle({
    Name = "Farm Bone / Cake",
    Callback = function(v) getgenv().FarmBone = v end
})

task.spawn(function()
    while task.wait() do
        if getgenv().AutoFarm then
            -- ATTACK HERE
        end
    end
end)

-- ================= SEA TAB =================
SeaTab:CreateSection("🚢 Sea Event")

SeaTab:CreateToggle({
    Name = "Auto Sea Event",
    Callback = function(v) getgenv().AutoSea = v end
})

SeaTab:CreateToggle({
    Name = "Auto Sea Beast / Cá",
    Callback = function(v) getgenv().AutoSeaBeast = v end
})

SeaTab:CreateToggle({
    Name = "Anti Rớt Biển / Đứng Nước",
    CurrentValue = true,
    Callback = function(v) getgenv().AntiSea = v end
})

-- ================= BOSS TAB =================
BossTab:CreateSection("🔥 Boss")

BossTab:CreateToggle({
    Name = "Auto Blackbeard",
    Callback = function(v) getgenv().KillBB = v end
})

BossTab:CreateToggle({
    Name = "Auto Rip Indra",
    Callback = function(v) getgenv().KillIndra = v end
})

BossTab:CreateToggle({
    Name = "Auto Dough King",
    Callback = function(v) getgenv().KillDough = v end
})

-- ================= V4 TAB =================
V4Tab:CreateSection("🧬 Upgrade / Trial")

V4Tab:CreateToggle({
    Name = "Auto bật V3",
    Callback = function(v) getgenv().AutoV3 = v end
})

V4Tab:CreateToggle({
    Name = "Auto bật V4",
    Callback = function(v) getgenv().AutoV4 = v end
})

V4Tab:CreateToggle({
    Name = "Auto Trial (Ghoul / Angel / Mink / Cyborg)",
    Callback = function(v) getgenv().AutoTrial = v end
})

-- Auto V3 / V4
task.spawn(function()
    while task.wait(2) do
        if getgenv().AutoV3 then
            pcall(function()
                RS.Remotes.CommF_:InvokeServer("ActivateRace")
            end)
        end
        if getgenv().AutoV4 then
            pcall(function()
                RS.Remotes.CommF_:InvokeServer("ActivateV4")
            end)
        end
    end
end)

-- ================= FULL MOON TAB =================
MoonTab:CreateSection("🌙 Full Moon")

MoonTab:CreateToggle({
    Name = "Auto Hop Server Full Moon",
    Callback = function(v) getgenv().HopFullMoon = v end
})

task.spawn(function()
    while task.wait(3) do
        if getgenv().HopFullMoon and not IsFullMoon() then
            TeleportService:Teleport(game.PlaceId, LP)
        end
    end
end)

-- ================= SETTINGS TAB =================
SetTab:CreateSection("🏃 Character")

SetTab:CreateSlider({
    Name = "Speed",
    Range = {16,300},
    CurrentValue = 16,
    Callback = function(v) getgenv().Speed = v end
})

SetTab:CreateSlider({
    Name = "Jump Power",
    Range = {50,300},
    CurrentValue = 50,
    Callback = function(v) getgenv().Jump = v end
})

SetTab:CreateToggle({
    Name = "Dash (Q)",
    Callback = function(v) getgenv().Dash = v end
})

SetTab:CreateToggle({
    Name = "Xoá Sương Mù",
    CurrentValue = true,
    Callback = function(v)
        if v then Lighting.FogEnd = 100000 end
    end
})

task.spawn(function()
    while task.wait(0.2) do
        local hum = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.WalkSpeed = getgenv().Speed
            hum.JumpPower = getgenv().Jump
        end
    end
end)
