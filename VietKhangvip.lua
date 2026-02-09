-- ✅ TÉO HUB | FIXED & STABLE VERSION 🍎
repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- 🟢 Nút mở menu
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Name = "TeoHub_Menu"

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.1, 0, 0.16, 0)
ImageButton.Size = UDim2.new(0, 40, 0, 40)
ImageButton.Draggable = true
ImageButton.Image = "http://www.roblox.com/asset/?id=15059956542"

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = ImageButton

ImageButton.MouseButton1Down:Connect(function()
	game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game)
end)

-- 🟣 Fluent UI
local Fluent = loadstring(game:HttpGet(
	"https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"
))()

-- 🪟 Cửa sổ chính
local Window = Fluent:CreateWindow({
	Title = "VK hub =}",
	SubTitle = "premium",
	TabWidth = 157,
	Size = UDim2.fromOffset(450, 300),
	Acrylic = true,
	Theme = "Aqua",
	MinimizeKey = Enum.KeyCode.End
})

-- 📑 Tabs
local Tabs = {
	Main0 = Window:AddTab({ Title = "main farm" }),
	Main1 = Window:AddTab({ Title = "setting farm" }),
	Main2 = Window:AddTab({ Title = "ofter farm" }),
	Main3 = Window:AddTab({ Title = "stack farm" }),
	Main4 = Window:AddTab({ Title = "sea event" }),
	Main5 = Window:AddTab({ Title = "dragon dojo" })
}

------------------------------------------------
-- TAB 1: TikTok
------------------------------------------------
local function CopyLink(link)
	if setclipboard then
		setclipboard(link)
		Fluent:Notify({
			Title = "Đã copy!",
			Content = "Link đã được sao chép 📋",
			Duration = 3
		})
	else
		Fluent:Notify({
			Title = "Lỗi",
			Content = "Executor không hỗ trợ copy",
			Duration = 3
		})
	end
end

Tabs.Main0:AddButton({
	Title = "tiktok bạn :)",
	Callback = function()
		CopyLink("https://www.tiktok.com/@jannie3342")
	end
})

Tabs.Main0:AddButton({
	Title = "tik",
	Description = "làm chơi thui",
	Callback = function()
		CopyLink("https://www.tiktok.com/@b.yt03")
	end
})

Tabs.Main0:AddButton({
	Title = "tiktok",
	Description = "fl để biết thêm script",
	Callback = function()
		CopyLink("https://www.tiktok.com/@b.yt03")
	end
})

------------------------------------------------
-- TAB 2: Script ngoài
------------------------------------------------
Tabs.Main1:AddButton({
	Title = "VK hub",
	Description = "script ngon đủ chức năng 😃",
	Callback = function()
		getgenv().Settings = {
			JoinTeam = "Pirates",
			Translator = true
		}
		loadstring(game:HttpGet(
			"https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"
		))()
	end
})
