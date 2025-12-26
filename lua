shared.LoaderTitle = "Loading Script May take few minutes...";
shared.LoaderKeyFrames = {
    [1] = {20, 10},
    [2] = {30, 30},
    [3] = {60, 60},
    [4] = {50, 100}
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

-- Loader UI Creation
local v5 = CreateObject("ScreenGui", {
    Name = "Core",
    Parent = game.CoreGui
});
local v6 = CreateObject("Frame", {
    Name = "Main",
    Parent = v5,
    BackgroundColor3 = v2.LoaderData.Colors.Main,
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    Position = UDim2.new(0.5, 0, 0.5, 0),
    AnchorPoint = Vector2.new(0.5, 0.5),
    Size = UDim2.new(0, 0, 0, 0)
});
v4(12, v6);


local v7 = CreateObject("ImageLabel", {
    Name = "UserImage",
    Parent = v6,
    BackgroundTransparency = 1,
    Image = "rbxassetid://123958108501740",
    Position = UDim2.new(0, 15, 0, 10),
    Size = UDim2.new(0, 50, 0, 50)
});
v4(25, v7);
local v8 = CreateObject("TextLabel", {
    Name = "UserName",
    Parent = v6,
    BackgroundTransparency = 1,
    Text = "Youtube: NeilDark",
    Position = UDim2.new(0, 75, 0, 10),
    Size = UDim2.new(0, 200, 0, 50),
    Font = Enum.Font.GothamBold,
    TextColor3 = v2.LoaderData.Colors.Title,
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Left
});
local v9 = CreateObject("TextLabel", {
    Name = "Top",
    TextTransparency = 1,
    Parent = v6,
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    BackgroundTransparency = 1,
    Position = UDim2.new(0, 30, 0, 70),
    Size = UDim2.new(0, 301, 0, 20),
    Font = Enum.Font.Gotham,
    Text = "Loader",
    TextColor3 = v2.LoaderData.Colors.Topic,
    TextSize = 10,
    TextXAlignment = Enum.TextXAlignment.Left
});
local v10 = CreateObject("TextLabel", {
    Name = "Title",
    Parent = v6,
    TextTransparency = 2,
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    BackgroundTransparency = 1,
    Position = UDim2.new(0, 30, 0, 90),
    Size = UDim2.new(0, 301, 0, 46),
    Font = Enum.Font.Gotham,
    RichText = true,
    Text = "<b>" .. v2.LoaderData.Name .. "</b>",
    TextColor3 = v2.LoaderData.Colors.Title,
    TextSize = 10,
    TextXAlignment = Enum.TextXAlignment.Left
});
local v11 = CreateObject("Frame", {
    Name = "BG",
    Parent = v6,
    AnchorPoint = Vector2.new(0.5, 0),
    BackgroundTransparency = 1,
    BackgroundColor3 = v2.LoaderData.Colors.LoaderBackground,
    BorderSizePixel = 0,
    Position = UDim2.new(0.5, 0, 0, 70),
    Size = UDim2.new(0.8500000238418579, 0, 0, 24)
});
v4(8, v11);
local v12 = CreateObject("Frame", {
    Name = "Progress",
    Parent = v11,
    BackgroundColor3 = v2.LoaderData.Colors.LoaderSplash,
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    Size = UDim2.new(0, 0, 0, 24)
});
v4(8, v12);
local v13 = CreateObject("TextLabel", {
    Name = "StepLabel",
    Parent = v6,
    BackgroundTransparency = 1,
    Position = UDim2.new(0.5, 0, 1, -25),
    Size = UDim2.new(1, -20, 0, 20),
    Font = Enum.Font.Gotham,
    Text = "",
    TextColor3 = v2.LoaderData.Colors.Topic,
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Center,
    AnchorPoint = Vector2.new(0.5, 0.5)
});

function UpdateStepText(v191)
    v13.Text = v3[v191] or "";
end
function UpdatePercentage(v193, v194)
    TweenObject(v12, 0.5, {Size = UDim2.new(v193 / 100, 0, 0, 24)});
    UpdateStepText(v194);
end

-- Loader Animation Sequence
TweenObject(v6, 0.25, {Size = UDim2.new(0, 346, 0, 121)});
wait();
TweenObject(v9, 0.5, {TextTransparency = 0});
TweenObject(v10, 0.5, {TextTransparency = 0});
TweenObject(v11, 0.5, {BackgroundTransparency = 0});
TweenObject(v12, 0.5, {BackgroundTransparency = 0});
for v195, v196 in pairs(v2.Keyframes) do
    wait(v196[1]);
    UpdatePercentage(v196[2], v195);
end
UpdatePercentage(100, 4);
TweenObject(v9, 0.5, {TextTransparency = 1});
TweenObject(v10, 0.5, {TextTransparency = 1});
TweenObject(v11, 0.5, {BackgroundTransparency = 1});
TweenObject(v12, 0.5, {BackgroundTransparency = 1});
wait(0.5);
TweenObject(v6, 0.25, {Size = UDim2.new(0, 0, 0, 0)});
wait(0.25);

-- Clean up loader
v5:Destroy();

-- SAB UTILS SCRIPT (UNCHANGED)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local isTeleporting = false
local noclipEnabled = false
local noclipConn = nil

local fastStealOn = false
local fastStealLoop = nil
local fastStealConn = nil

local function getCharacter()
    local char = LocalPlayer.Character
    if not char or not char.Parent then
        char = LocalPlayer.CharacterAdded:Wait()
    end
    return char
end

local function getMyPlot()
    local plots = workspace:FindFirstChild("Plots")
    if not plots then return nil end
    for _, plot in ipairs(plots:GetChildren()) do
        local label = plot:FindFirstChild("PlotSign")
            and plot.PlotSign:FindFirstChild("SurfaceGui")
            and plot.PlotSign.SurfaceGui:FindFirstChild("Frame")
            and plot.PlotSign.SurfaceGui.Frame:FindFirstChild("TextLabel")
        if label then
            local t = (label.ContentText or label.Text or "")
            if t:find(LocalPlayer.DisplayName) and t:find("Base") then
                return plot
            end
        end
    end
    return nil
end

local function getDeliveryHitbox()
    local myPlot = getMyPlot()
    if not myPlot then return nil end
    local delivery = myPlot:FindFirstChild("DeliveryHitbox") or myPlot:FindFirstChild("DeliveryHitbox", true)
    if delivery and delivery:IsA("BasePart") then
        return delivery
    end
    return nil
end

local function setNoclip(on)
    noclipEnabled = on
    if on then
        if noclipConn then noclipConn:Disconnect() end
        noclipConn = RunService.Stepped:Connect(function()
            local char = LocalPlayer.Character
            if not char then return end
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end)
    else
        if noclipConn then
            noclipConn:Disconnect()
            noclipConn = nil
        end
        local char = LocalPlayer.Character
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end
end

local function shortTeleportFreezeCamera(targetCF, duration)
    if isTeleporting then return end
    isTeleporting = true
    duration = duration or 0.2
    if duration < 0.1 then duration = 0.1 end
    if duration > 0.5 then duration = 0.5 end
    local character = getCharacter()
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then
        isTeleporting = false
        return
    end
    local camera = workspace.CurrentCamera
    if not camera then
        isTeleporting = false
        return
    end
    local originalCF = hrp.CFrame
    local originalCamType = camera.CameraType
    local originalCamSub = camera.CameraSubject
    local originalCamCFrame = camera.CFrame
    local function restoreCamera()
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then
            camera.CameraSubject = hum
            camera.CameraType = Enum.CameraType.Custom
        else
            camera.CameraType = originalCamType or Enum.CameraType.Custom
            camera.CameraSubject = originalCamSub
        end
        camera.CFrame = originalCamCFrame
    end
    local ok = pcall(function()
        camera.CameraType = Enum.CameraType.Scriptable
        camera.CFrame = originalCamCFrame
        hrp.CFrame = targetCF
        task.wait(duration)
        hrp.CFrame = originalCF
    end)
    restoreCamera()
    isTeleporting = false
    if not ok then
        warn("[SAB UTILS] shortTeleport error")
    end
end

local function doInstantSteal()
    local character = getCharacter()
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local delivery = getDeliveryHitbox()
    if not delivery then return end
    local targetCF = delivery.CFrame + delivery.CFrame.LookVector * 3 + Vector3.new(0, 3, 0)
    shortTeleportFreezeCamera(targetCF, 0.25)
end

local function doForwardTP()
    local character = getCharacter()
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * 8
end

local function patchPrompt(prompt)
    if not prompt:IsA("ProximityPrompt") then return end
    local ok = pcall(function()
        if prompt.HoldDuration > 0.01 then
            prompt.HoldDuration = 0.01
        end
    end)
end

local function setFastSteal(on)
    fastStealOn = on
    if on then
        task.spawn(function()
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("ProximityPrompt") then
                    patchPrompt(obj)
                end
            end
        end)
        if not fastStealLoop then
            fastStealLoop = task.spawn(function()
                while fastStealOn do
                    local ok, err = pcall(function()
                        for _, obj in ipairs(workspace:GetDescendants()) do
                            if obj:IsA("ProximityPrompt") then
                                patchPrompt(obj)
                            end
                        end
                    end)
                    if not ok then
                        warn("[SAB UTILS] FastSteal loop error:", err)
                    end
                    task.wait(0.08)
                end
                fastStealLoop = nil
            end)
        end
        if fastStealConn then fastStealConn:Disconnect() end
        fastStealConn = workspace.DescendantAdded:Connect(function(obj)
            if fastStealOn and obj:IsA("ProximityPrompt") then
                patchPrompt(obj)
            end
        end)
    else
        if fastStealConn then
            fastStealConn:Disconnect()
            fastStealConn = nil
        end
    end
end

local function createUI()
    local guiParent = game:GetService("CoreGui")
    pcall(function()
        if gethui then
            local h = gethui()
            if h then guiParent = h end
        end
    end)
    
    local old = guiParent:FindFirstChild("SAB_Utils_UI")
    if old then old:Destroy() end
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "SAB_Utils_UI"
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    screenGui.Parent = guiParent
    
    screenGui.AncestryChanged:Connect(function(_, parent)
        if not parent then
            setNoclip(false)
            setFastSteal(false)
        end
    end)
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 250, 0, 240)
    mainFrame.Position = UDim2.new(0.68, -125, 0.55, -120)
    mainFrame.BackgroundColor3 = Color3.fromRGB(10, 15, 35)
    mainFrame.BorderSizePixel = 0
    mainFrame.Visible = true
    mainFrame.Parent = screenGui
    mainFrame.ClipsDescendants = true
    
    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 20)
    cardCorner.Parent = mainFrame
    
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0.0, Color3.fromRGB(60, 30, 120)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(35, 20, 80)),
        ColorSequenceKeypoint.new(1.0, Color3.fromRGB(10, 15, 35))
    }
    gradient.Rotation = 45
    gradient.Parent = mainFrame
    
    local glow = Instance.new("UIStroke")
    glow.Color = Color3.fromRGB(120, 80, 255)
    glow.Thickness = 2
    glow.Transparency = 0.3
    glow.Parent = mainFrame
    
    local header = Instance.new("Frame")
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, 45)
    header.BackgroundColor3 = Color3.fromRGB(25, 15, 60)
    header.BorderSizePixel = 0
    header.Parent = mainFrame
    
    local headerCorner = Instance.new("UICorner")
    headerCorner.CornerRadius = UDim.new(0, 20)
    headerCorner.Parent = header
    
    local headerStroke = Instance.new("UIStroke")
    headerStroke.Color = Color3.fromRGB(100, 60, 200)
    headerStroke.Thickness = 1
    headerStroke.Parent = header
    
    local title = Instance.new("TextLabel")
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(1, -50, 0.6, 0)
    title.Position = UDim2.new(0, 15, 0, 5)
    title.Font = Enum.Font.GothamBold
    title.Text = "🧠 Steal a Brainrot"
    title.TextSize = 16
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = header
    
    local subtitle = Instance.new("TextLabel")
    subtitle.BackgroundTransparency = 1
    subtitle.Size = UDim2.new(1, -50, 0.4, 0)
    subtitle.Position = UDim2.new(0, 15, 0, 25)
    subtitle.Font = Enum.Font.Gotham
    subtitle.Text = "Youtube:NeilDark"
    subtitle.TextSize = 12
    subtitle.TextColor3 = Color3.fromRGB(150, 200, 255)
    subtitle.TextXAlignment = Enum.TextXAlignment.Left
    subtitle.Parent = header
    
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 28, 0, 28)
    closeBtn.Position = UDim2.new(1, -35, 0.5, -14)
    closeBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
    closeBtn.Text = "✕"
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 16
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.Parent = header
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 14)
    closeCorner.Parent = closeBtn
    
    closeBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)
    
    -- Dragging functionality
    do
        local dragging = false
        local dragInput, dragStart, startPos
        local function update(input)
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
        header.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = mainFrame.Position
                dragInput = input
                input.Changed:Connect(function(i)
                    if i.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)
        header.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if dragging and input == dragInput then
                update(input)
            end
        end)
    end
    
    local body = Instance.new("Frame")
    body.Size = UDim2.new(1, -20, 1, -60)
    body.Position = UDim2.new(0, 10, 0, 50)
    body.BackgroundTransparency = 1
    body.Parent = mainFrame
    
    local list = Instance.new("UIListLayout")
    list.FillDirection = Enum.FillDirection.Vertical
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list.Padding = UDim.new(0, 8)
    list.Parent = body
    
    local function makeButton(text, color, textColor, onColor)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 0, 38)
        btn.BackgroundColor3 = color
        btn.AutoButtonColor = false
        btn.Font = Enum.Font.GothamBold
        btn.Text = text
        btn.TextSize = 14
        btn.TextColor3 = textColor or Color3.fromRGB(255, 255, 255)
        btn.Parent = body
        
        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 12)
        btnCorner.Parent = btn
        
        local btnStroke = Instance.new("UIStroke")
        btnStroke.Color = Color3.fromRGB(255, 255, 255)
        btnStroke.Thickness = 1
        btnStroke.Transparency = 0.7
        btnStroke.Parent = btn
        
        btn.MouseEnter:Connect(function()
            local tween = game:GetService("TweenService"):Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = onColor or color:lerp(Color3.new(1,1,1), 0.1)})
            tween:Play()
        end)
        btn.MouseLeave:Connect(function()
            local tween = game:GetService("TweenService"):Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = color})
            tween:Play()
        end)
        
        return btn
    end
    
    local instantBtn = makeButton("⚡ INSTANT STEAL", Color3.fromRGB(100, 200, 255), Color3.fromRGB(20, 30, 60), Color3.fromRGB(120, 220, 255))
    local forwardBtn = makeButton("🚀 TP FORWARD", Color3.fromRGB(100, 255, 150), Color3.fromRGB(20, 40, 25), Color3.fromRGB(120, 255, 170))
    local noclipBtn = makeButton("👻 NOCLIP: OFF", Color3.fromRGB(180, 120, 255), Color3.fromRGB(255, 255, 255), Color3.fromRGB(200, 150, 255))
    local fastBtn = makeButton("⏩ FAST STEAL: OFF", Color3.fromRGB(255, 180, 100), Color3.fromRGB(40, 25, 10), Color3.fromRGB(255, 200, 120))
    
    instantBtn.MouseButton1Click:Connect(doInstantSteal)
    forwardBtn.MouseButton1Click:Connect(doForwardTP)
    
    local noclipText = "👻 NOCLIP: OFF"
    noclipBtn.MouseButton1Click:Connect(function()
        local newState = not noclipEnabled
        setNoclip(newState)
        noclipText = newState and "👻 NOCLIP: ON" or "👻 NOCLIP: OFF"
        noclipBtn.Text = noclipText
    end)
    
    local fastText = "⏩ FAST STEAL: OFF"
    fastBtn.MouseButton1Click:Connect(function()
        local newState = not fastStealOn
        setFastSteal(newState)
        fastText = newState and "⏩ FAST STEAL: ON" or "⏩ FAST STEAL: OFF"
        fastBtn.Text = fastText
    end)
    
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Name = "ToggleButton"
    toggleBtn.Size = UDim2.new(0, 40, 0, 40)
    toggleBtn.Position = UDim2.new(0.02, 0, 0.5, -20)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(60, 30, 120)
    toggleBtn.Text = "≡"
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextSize = 18
    toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.Parent = screenGui
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 20)
    toggleCorner.Parent = toggleBtn

    local toggleStroke = Instance.new("UIStroke")
    toggleStroke.Color = Color3.fromRGB(120, 80, 255)
    toggleStroke.Thickness = 2
    toggleStroke.Parent = toggleBtn
    
    toggleBtn.MouseButton1Click:Connect(function()
        mainFrame.Visible = not mainFrame.Visible
        toggleBtn.Text = mainFrame.Visible and "≡" or "▶"
    end)
    
    local uiScale = Instance.new("UIScale")
    uiScale.Scale = 1
    uiScale.Parent = mainFrame
    
    local function updateScale()
        local cam = workspace.CurrentCamera
        if not cam then return end
        local vp = cam.ViewportSize
        local minSide = math.min(vp.X, vp.Y)
        uiScale.Scale = (minSide <= 720) and 0.9 or 1
    end
    updateScale()
    RunService.Heartbeat:Connect(updateScale)
end

createUI()
