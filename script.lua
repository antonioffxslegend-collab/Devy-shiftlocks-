-- ========================================================
--   🎀 DEVY CURSORS PANEL 🎀
--   Todos os Cursores + Shift Lock + Ajuste de Tamanho
-- ========================================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

-- ================= CONFIGURAÇÕES =================
local cursorSize = 32
local currentCursorId = "rbxassetid://131843855435385"
local DefaultImages = {"rbxasset://textures/MouseLockedCursor.png","rbxasset://textures/MouseLockedCursor@2x.png"}
local ShiftlockObjects = {}

local allCursors = {
    {Name="White", Id="rbxassetid://131843855435385"},
    {Name="Purple", Id="rbxassetid://105227484929270"},
    {Name="Dark Red", Id="rbxassetid://70807381747714"},
    {Name="Black", Id="rbxassetid://134411152875782"},
    {Name="Pink", Id="rbxassetid://101446374921049"},
    {Name="Blue", Id="rbxassetid://94640444703376"},
    {Name="Green", Id="rbxassetid://112063814299010"},
    {Name="Teal", Id="rbxassetid://105472303240225"},
    {Name="Hot Pink", Id="rbxassetid://120423063723029"},
    {Name="Red", Id="rbxassetid://93953005352303"},
    {Name="Mocha", Id="rbxassetid://123066282804999"},
    {Name="Cinnamoroll", Id="rbxassetid://130820173728340"},
    {Name="Blue Diamond", Id="rbxassetid://86867462006638"},
    {Name="Red Diamond", Id="rbxassetid://92104309771570"},
    {Name="Red Star", Id="rbxassetid://93839976680281"},
    {Name="Orange", Id="rbxassetid://132782590439670"},
    {Name="Kuromi", Id="rbxassetid://94422136876896"},
    {Name="Hello Kitty", Id="rbxassetid://124324922920553"},
    {Name="Hello Kitty Bow", Id="rbxassetid://120839586609926"},
    {Name="Apple Jack", Id="rbxassetid://105737560480211"},
    {Name="Chococat", Id="rbxthumb://type=Asset&id=118126832694865&w=150&h=150"},
    {Name="Star Perplexo", Id="rbxthumb://type=Asset&id=130225909042821&w=150&h=150"},
    {Name="White Star", Id="rbxthumb://type=Asset&id=91945747069689&w=150&h=150"},
    {Name="Teal Star", Id="rbxthumb://type=Asset&id=92452799913309&w=150&h=150"},
    {Name="Purple Bow", Id="rbxthumb://type=Asset&id=88548312898815&w=150&h=150"},
    {Name="Pompompurin", Id="rbxassetid://74655745935138"},
    {Name="Elii Blue Bow", Id="rbxassetid://111473814494633"}
}

-- ================= LÓGICA DE SHIFT LOCK =================
local function ScanShiftLock()
    ShiftlockObjects = {}
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("ImageLabel") or v:IsA("ImageButton") then
            if table.find(DefaultImages, v.Image) or string.find(string.lower(v.Name), "shift") or string.find(string.lower(v.Name), "lock") then
                table.insert(ShiftlockObjects, v)
            end
        end
    end
end

local function ApplyCursor()
    for _, v in pairs(ShiftlockObjects) do
        if v and v.Parent then
            v.Image = currentCursorId
            v.Size = UDim2.new(0, cursorSize, 0, cursorSize)
            v.ImageTransparency = (cursorSize == 0) and 1 or 0
            v.BackgroundTransparency = 1
            v.ScaleType = Enum.ScaleType.Fit
        end
    end
end

-- Fica de olho se o jogador tomar shift lock dnv
game.DescendantAdded:Connect(function(v)
    task.wait(1)
    if v:IsA("ImageLabel") or v:IsA("ImageButton") then
        if table.find(DefaultImages, v.Image) or string.find(string.lower(v.Name), "shift") or string.find(string.lower(v.Name), "lock") then
            table.insert(ShiftlockObjects, v)
            ApplyCursor()
        end
    end
end)
ScanShiftLock()

-- ================= UI DESIGN =================
local gui = Instance.new("ScreenGui")
gui.Name = "DevyCursorPanel"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = player:WaitForChild("PlayerGui")

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 45, 0, 45)
toggleBtn.Position = UDim2.new(0, 20, 0.4, -22)
toggleBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
toggleBtn.Text = "🖱️"
toggleBtn.TextSize = 20
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.AutoButtonColor = false
toggleBtn.Parent = gui
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(1, 0)
local tStroke = Instance.new("UIStroke", toggleBtn)
tStroke.Color = Color3.fromRGB(150, 150, 170)
tStroke.Thickness = 2

local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 280, 0, 300)
panel.Position = UDim2.new(0.5, -140, 0.5, -150)
panel.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
panel.Visible = false
panel.Active = true
panel.Parent = gui
Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 12)
local pStroke = Instance.new("UIStroke", panel)
pStroke.Color = Color3.fromRGB(60, 60, 70)
pStroke.Thickness = 2

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 35)
header.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
header.Parent = panel
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 1, 0)
title.BackgroundTransparency = 1
title.Text = "Devy Cursors"
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Parent = header

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 25, 0, 25)
closeBtn.Position = UDim2.new(1, -30, 0.5, -12)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 12
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Parent = header
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(1, 0)

-- Arrastar Painel
local dragging, dragInput, dragStart, startPos
header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true; dragStart = input.Position; startPos = panel.Position
        input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
    end
end)
header.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        panel.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Toggle Botão
local tDrag, tStart, tPos, tMoved
toggleBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        tDrag = true; tMoved = false; tStart = input.Position; tPos = toggleBtn.Position
    end
end)
toggleBtn.InputChanged:Connect(function(input)
    if tDrag and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local d = input.Position - tStart
        if math.abs(d.X) > 5 or math.abs(d.Y) > 5 then tMoved = true end
        toggleBtn.Position = UDim2.new(tPos.X.Scale, tPos.X.Offset + d.X, tPos.Y.Scale, tPos.Y.Offset + d.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if tDrag then tDrag = false; if not tMoved then panel.Visible = not panel.Visible end end
    end
end)
closeBtn.MouseButton1Click:Connect(function() panel.Visible = false end)

-- ================= CONTEÚDO =================
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -10, 1, -45)
scroll.Position = UDim2.new(0, 5, 0, 40)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 3
scroll.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 70)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.Parent = panel

-- Caixa de Tamanho fica no topo
local sizeF = Instance.new("Frame")
sizeF.Size = UDim2.new(1, -10, 0, 35)
sizeF.Position = UDim2.new(0, 5, 0, 5)
sizeF.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
sizeF.Parent = scroll
Instance.new("UICorner", sizeF).CornerRadius = UDim.new(0, 8)

local sizeLbl = Instance.new("TextLabel")
sizeLbl.Size = UDim2.new(0.5, 0, 1, 0)
sizeLbl.Position = UDim2.new(0, 10, 0, 0)
sizeLbl.BackgroundTransparency = 1
sizeLbl.Text = "Tamanho:"
sizeLbl.Font = Enum.Font.GothamBold
sizeLbl.TextSize = 11
sizeLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
sizeLbl.TextXAlignment = Enum.TextXAlignment.Left
sizeLbl.Parent = sizeF

local sizeInput = Instance.new("TextBox")
sizeInput.Size = UDim2.new(0.4, 0, 1, -10)
sizeInput.Position = UDim2.new(0.55, 0, 0, 5)
sizeInput.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
sizeInput.Text = tostring(cursorSize)
sizeInput.Font = Enum.Font.GothamBold
sizeInput.TextSize = 12
sizeInput.TextColor3 = Color3.fromRGB(200, 150, 255)
sizeInput.Parent = sizeF
Instance.new("UICorner", sizeInput).CornerRadius = UDim.new(0, 6)
sizeInput.FocusLost:Connect(function()
    local v = tonumber(sizeInput.Text)
    if v then cursorSize = math.clamp(v, 0, 150); sizeInput.Text = tostring(cursorSize); ApplyCursor() else sizeInput.Text = tostring(cursorSize) end
end)

-- Grade de Cursors
local gridFrame = Instance.new("Frame")
gridFrame.Size = UDim2.new(1, -10, 0, 0)
gridFrame.Position = UDim2.new(0, 5, 0, 45)
gridFrame.BackgroundTransparency = 1
gridFrame.Parent = scroll

local grid = Instance.new("UIGridLayout", gridFrame)
grid.CellSize = UDim2.new(0, 45, 0, 45)
grid.CellPadding = UDim2.new(0, 6, 0, 6)
grid.HorizontalAlignment = Enum.HorizontalAlignment.Center
grid:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    gridFrame.Size = UDim2.new(1, -10, 0, grid.AbsoluteContentSize.Y)
    scroll.CanvasSize = UDim2.new(0, 0, 0, grid.AbsoluteContentSize.Y + 60)
end)

for _, data in ipairs(allCursors) do
    local ib = Instance.new("ImageButton")
    ib.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
    ib.ScaleType = Enum.ScaleType.Fit
    ib.Image = data.Id
    ib.Parent = gridFrame
    Instance.new("UICorner", ib).CornerRadius = UDim.new(0, 8)
    
    ib.MouseButton1Click:Connect(function()
        currentCursorId = data.Id
        ApplyCursor()
    end)
end

print("🎀 Cursor Panel carregado!")
