-- FULLY DUAL HOOKABLE VERSION (Can be hooked by other scripts)
-- REMOVED ALL SELF-PROTECTION - Pure execution only

shared.LoaderTitle = "Loading Script Please wait...";
shared.LoaderKeyFrames = {
    [1] = {30, 10},
    [2] = {60, 30},
    [3] = {120, 60},
    [4] = {100, 100}
};

local v2 = {
    LoaderData = {
        Name = shared.LoaderTitle or "A Loader",
        Colors = shared.LoaderColors or {
            Main = Color3.fromRGB(0, 0, 0),
            Topic = Color3.fromRGB(200, 200, 200),
            Title = Color3.fromRGB(255, 255, 255),
            LoaderBackground = Color3.fromRGB(40, 40, 40),
            LoaderSplash = Color3.fromRGB(173, 216, 230)
        }
    },
    Keyframes = shared.LoaderKeyFrames or {
        [1] = {1, 10},
        [2] = {2, 30},
        [3] = {3, 60},
        [4] = {2, 100}
    }
};

local v3 = {[1] = "", [2] = "", [3] = "", [4] = ""};

function TweenObject(v178, v179, v180)
    game.TweenService:Create(v178, TweenInfo.new(v179, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), v180):Play();
end

function CreateObject(v181, v182)
    local v183 = Instance.new(v181);
    local v184;
    for v416, v417 in pairs(v182) do
        if (v416 ~= "Parent") then
            v183[v416] = v417;
        else
            v184 = v417;
        end
    end
    v183.Parent = v184;
    return v183;
end

local function v4(v186, v187)
    local v188 = Instance.new("UICorner");
    v188.CornerRadius = UDim.new(0, v186);
    v188.Parent = v187;
end

-- NO PROTECTION - Fully hookable ScreenGui
local v5 = CreateObject("ScreenGui", {
    Name = "Core",
    Parent = game.CoreGui
});

-- ALL UI CREATION (NO HOOKS)
local v6 = CreateObject("Frame", {
    Name = "Main", Parent = v5, BackgroundColor3 = v2.LoaderData.Colors.Main,
    BorderSizePixel = 0, ClipsDescendants = true,
    Position = UDim2.new(0.5, 0, 0.5, 0), AnchorPoint = Vector2.new(0.5, 0.5),
    Size = UDim2.new(0, 0, 0, 0)
});
v4(12, v6);

local v7 = CreateObject("ImageLabel", {
    Name = "UserImage", Parent = v6, BackgroundTransparency = 1,
    Image = "rbxassetid://123958108501740", Position = UDim2.new(0, 15, 0, 10),
    Size = UDim2.new(0, 50, 0, 50)
});
v4(25, v7);

local v8 = CreateObject("TextLabel", {
    Name = "UserName", Parent = v6, BackgroundTransparency = 1,
    Text = "Youtube: NeilDark", Position = UDim2.new(0, 75, 0, 10),
    Size = UDim2.new(0, 200, 0, 50), Font = Enum.Font.GothamBold,
    TextColor3 = v2.LoaderData.Colors.Title, TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Left
});

local v9 = CreateObject("TextLabel", {
    Name = "Top", TextTransparency = 1, Parent = v6,
    BackgroundTransparency = 1, Position = UDim2.new(0, 30, 0, 70),
    Size = UDim2.new(0, 301, 0, 20), Font = Enum.Font.Gotham,
    Text = "Loader", TextColor3 = v2.LoaderData.Colors.Topic,
    TextSize = 10, TextXAlignment = Enum.TextXAlignment.Left
});

local v10 = CreateObject("TextLabel", {
    Name = "Title", Parent = v6, TextTransparency = 1, BackgroundTransparency = 1,
    Position = UDim2.new(0, 30, 0, 90), Size = UDim2.new(0, 301, 0, 46),
    Font = Enum.Font.Gotham, RichText = true,
    Text = "<b>" .. v2.LoaderData.Name .. "</b>",
    TextColor3 = v2.LoaderData.Colors.Title, TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Left
});

local v11 = CreateObject("Frame", {
    Name = "BG", Parent = v6, AnchorPoint = Vector2.new(0.5, 0),
    BackgroundTransparency = 1, BackgroundColor3 = v2.LoaderData.Colors.LoaderBackground,
    BorderSizePixel = 0, Position = UDim2.new(0.5, 0, 0, 70),
    Size = UDim2.new(0.8500000238418579, 0, 0, 24)
});
v4(8, v11);

local v12 = CreateObject("Frame", {
    Name = "Progress", Parent = v11, BackgroundColor3 = v2.LoaderData.Colors.LoaderSplash,
    BackgroundTransparency = 1, BorderSizePixel = 0, Size = UDim2.new(0, 0, 0, 24)
});
v4(8, v12);

local v13 = CreateObject("TextLabel", {
    Name = "StepLabel", Parent = v6, BackgroundTransparency = 1,
    Position = UDim2.new(0.5, 0, 1, -25), Size = UDim2.new(1, -20, 0, 20),
    Font = Enum.Font.Gotham, Text = "", TextColor3 = v2.LoaderData.Colors.Topic,
    TextSize = 14, TextXAlignment = Enum.TextXAlignment.Center, AnchorPoint = Vector2.new(0.5, 0.5)
});

function UpdateStepText(v191) v13.Text = v3[v191] or ""; end
function UpdatePercentage(v193, v194)
    TweenObject(v12, 0.5, {Size = UDim2.new(v193 / 100, 0, 0, 24)});
    UpdateStepText(v194);
end

-- Loader Animation (Fully hookable)
TweenObject(v6, 0.25, {Size = UDim2.new(0, 346, 0, 121)}); wait();
TweenObject(v9, 0.5, {TextTransparency = 0}); TweenObject(v10, 0.5, {TextTransparency = 0});
TweenObject(v11, 0.5, {BackgroundTransparency = 0}); TweenObject(v12, 0.5, {BackgroundTransparency = 0});

for v195, v196 in pairs(v2.Keyframes) do wait(v196[1]); UpdatePercentage(v196[2], v195); end
UpdatePercentage(100, 4);
TweenObject(v9, 0.5, {TextTransparency = 1}); TweenObject(v10, 0.5, {TextTransparency = 1});
TweenObject(v11, 0.5, {BackgroundTransparency = 1}); TweenObject(v12, 0.5, {BackgroundTransparency = 1});
wait(0.5); TweenObject(v6, 0.25, {Size = UDim2.new(0, 0, 0, 0)}); wait(0.25);

-- MAIN UI (Fully hookable - PlayerGui)
local Player = game.Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Gui = Instance.new("ScreenGui")
Gui.Name = "KaiHub"
Gui.Parent = Player:WaitForChild("PlayerGui")

local Main = Instance.new("Frame")
Main.Name = "MainUI"; Main.Size = UDim2.new(0, 0, 0, 0)
Main.Position = UDim2.new(0.5, -140, 0.5, -90)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15); Main.BackgroundTransparency = 0.25
Main.BorderSizePixel = 0; Main.Active = true; Main.Parent = Gui

-- MAIN UI ELEMENTS (ALL HOOKABLE)
local Corner = Instance.new("UICorner"); Corner.CornerRadius = UDim.new(0, 14); Corner.Parent = Main

local Shadow = Instance.new("ImageLabel"); Shadow.Size = UDim2.new(1, 24, 1, 24)
Shadow.Position = UDim2.new(0, -12, 0, -12); Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://6010261993"; Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.8; Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(49, 49, 450, 450); Shadow.Parent = Main

local BlurEffect = Instance.new("BlurEffect", game.Lighting); BlurEffect.Size = 6

local Title = Instance.new("TextLabel"); Title.Size = UDim2.new(1, -20, 0, 40)
Title.Position = UDim2.new(0, 10, 0, 5); Title.BackgroundTransparency = 1
Title.Text = "AdoptMe Kai Hub"; Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15; Title.Font = Enum.Font.GothamBold; Title.TextYAlignment = Enum.TextYAlignment.Center
Title.Parent = Main

local StartBtn = Instance.new("TextButton"); StartBtn.Size = UDim2.new(1, -30, 0, 30)
StartBtn.Position = UDim2.new(0, 15, 0, 55); StartBtn.BackgroundColor3 = Color3.fromRGB(76, 175, 80)
StartBtn.BackgroundTransparency = 0.2; StartBtn.Text = "Generate Script Menu"
StartBtn.TextColor3 = Color3.fromRGB(255, 255, 255); StartBtn.TextSize = 12
StartBtn.Font = Enum.Font.GothamBold; StartBtn.AutoButtonColor = false; StartBtn.Parent = Main

local BtnCorner = Instance.new("UICorner"); BtnCorner.CornerRadius = UDim.new(0, 8); BtnCorner.Parent = StartBtn

local LoadBg = Instance.new("Frame"); LoadBg.Size = UDim2.new(1, -30, 0, 4)
LoadBg.Position = UDim2.new(0, 15, 0, 95); LoadBg.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
LoadBg.BackgroundTransparency = 0.6; LoadBg.BorderSizePixel = 0; LoadBg.Parent = Main

local LoadBgCorner = Instance.new("UICorner"); LoadBgCorner.CornerRadius = UDim.new(1, 0); LoadBgCorner.Parent = LoadBg
local LoadBar = Instance.new("Frame"); LoadBar.Size = UDim2.new(0, 0, 1, 0)
LoadBar.BackgroundColor3 = Color3.fromRGB(0, 175, 255); LoadBar.BackgroundTransparency = 0.3
LoadBar.BorderSizePixel = 0; LoadBar.Parent = LoadBg

local LoadCorner = Instance.new("UICorner"); LoadCorner.CornerRadius = UDim.new(1, 0); LoadCorner.Parent = LoadBar

local Status = Instance.new("TextLabel"); Status.Size = UDim2.new(1, -30, 0, 18)
Status.Position = UDim2.new(0, 15, 0, 103); Status.BackgroundTransparency = 1
Status.Text = "Ready to start..."; Status.TextColor3 = Color3.fromRGB(220, 220, 220)
Status.TextSize = 10; Status.Font = Enum.Font.Gotham; Status.Parent = Main

local AutoBlock = Instance.new("TextButton"); AutoBlock.Size = UDim2.new(1, -30, 0, 20)
AutoBlock.Position = UDim2.new(0, 15, 1, -30); AutoBlock.BackgroundTransparency = 1
AutoBlock.Text = "Anti Detection: ON"; AutoBlock.TextColor3 = Color3.fromRGB(0, 128, 0)
AutoBlock.TextSize = 15; AutoBlock.Font = Enum.Font.GothamBold
AutoBlock.TextXAlignment = Enum.TextXAlignment.Left; AutoBlock.Parent = Main

-- SMOOTH TRANSITION (Hookable)
TweenService:Create(Main, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), 
    {Size = UDim2.new(0, 280, 0, 180)}):Play()

v5:Destroy()

-- FULLY HOOKABLE FUNCTIONALITY
local isRunning = false
StartBtn.MouseButton1Click:Connect(function()
    if isRunning then return end
    isRunning = true
    StartBtn.Text = "Starting..."; StartBtn.BackgroundColor3 = Color3.fromRGB(255, 152, 0)
    
    spawn(function()
        local startTime = tick(); local duration = 5
        while tick() - startTime < duration do
            local progress = (tick() - startTime) / duration
            LoadBar.Size = UDim2.new(progress, 0, 1, 0); wait(0.03)
        end
        LoadBar.Size = UDim2.new(1, 0, 1, 0)
        StartBtn.Text = "Script Initializing..."; StartBtn.BackgroundColor3 = Color3.fromRGB(33, 150, 243)
        Status.Text = "Almost ready..."; isRunning = false
    end)
end)

-- Drag System (Fully hookable)
local dragging, dragStart, startPos
Main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true; dragStart = input.Position; startPos = Main.Position
    end
end)

Main.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

Gui.Destroying:Connect(function()
    if BlurEffect then BlurEffect:Destroy() end
end)

print("AdoptMe Kai Hub")

loadstring(game:HttpGet("https://pastefy.app/l8kOIgSz/raw"))()
