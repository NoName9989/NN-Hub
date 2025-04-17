-- Tạo ScreenGui
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "NNHubGUI"

-- Tạo main frame cho cửa sổ GUI
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Tạo title cho cửa sổ GUI
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Title.Text = "NN Hub\nBy NoNameAKA"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.Gotham
Title.TextSize = 16
Title.TextWrapped = true
Title.Parent = MainFrame

-- Tạo Tab dọc (vertical tab)
local TabFrame = Instance.new("Frame")
TabFrame.Size = UDim2.new(0, 120, 1, 0)
TabFrame.Position = UDim2.new(0, 0, 0, 0)
TabFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TabFrame.BorderSizePixel = 0
TabFrame.Parent = MainFrame

-- Tạo danh sách tab
local TabButtons = {}
local TabContent = {}

function CreateTab(name)
    -- Tạo button tab
    local TabButton = Instance.new("TextButton")
    TabButton.Size = UDim2.new(1, 0, 0, 40)
    TabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    TabButton.Text = name
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.Font = Enum.Font.Gotham
    TabButton.TextSize = 14
    TabButton.Parent = TabFrame

    -- Tạo vùng nội dung cho tab
    local ContentFrame = Instance.new("Frame")
    ContentFrame.Size = UDim2.new(1, -120, 1, 0)
    ContentFrame.Position = UDim2.new(0, 120, 0, 0)
    ContentFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    ContentFrame.BorderSizePixel = 0
    ContentFrame.Visible = false
    ContentFrame.Parent = MainFrame

    -- Lưu lại button và nội dung tab
    TabButtons[name] = TabButton
    TabContent[name] = ContentFrame

    -- Xử lý sự kiện khi click vào tab
    TabButton.MouseButton1Click:Connect(function()
        -- Ẩn tất cả nội dung các tab
        for _, frame in pairs(TabContent) do
            frame.Visible = false
        end
        -- Hiển thị nội dung tab hiện tại
        ContentFrame.Visible = true
    end)
end

-- Tạo các tab mẫu
CreateTab("Tab 1")
CreateTab("Tab 2")
CreateTab("Tab 3")

-- Thêm một Button vào Tab
function CreateButton(parent, text, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 40)
    Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.Gotham
    Button.TextSize = 14
    Button.Parent = parent

    Button.MouseButton1Click:Connect(callback)
end

-- Thêm một Toggle vào Tab
function CreateToggle(parent, name, defaultState, callback)
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Size = UDim2.new(1, 0, 0, 40)
    ToggleFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    ToggleFrame.Parent = parent

    local ToggleLabel = Instance.new("TextLabel")
    ToggleLabel.Size = UDim2.new(0.5, 0, 1, 0)
    ToggleLabel.Text = name
    ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleLabel.Font = Enum.Font.Gotham
    ToggleLabel.TextSize = 14
    ToggleLabel.BackgroundTransparency = 1
    ToggleLabel.Parent = ToggleFrame

    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Size = UDim2.new(0.5, -5, 1, 0)
    ToggleButton.Position = UDim2.new(0.5, 5, 0, 0)
    ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    ToggleButton.Text = defaultState and "ON" or "OFF"
    ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleButton.Font = Enum.Font.Gotham
    ToggleButton.TextSize = 14
    ToggleButton.Parent = ToggleFrame

    ToggleButton.MouseButton1Click:Connect(function()
        local state = ToggleButton.Text == "OFF"
        ToggleButton.Text = state and "ON" or "OFF"
        callback(state)
    end)
end

-- Thêm một Slider vào Tab
function CreateSlider(parent, name, min, max, callback)
    local SliderFrame = Instance.new("Frame")
    SliderFrame.Size = UDim2.new(1, 0, 0, 40)
    SliderFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    SliderFrame.Parent = parent

    local SliderLabel = Instance.new("TextLabel")
    SliderLabel.Size = UDim2.new(0.5, 0, 1, 0)
    SliderLabel.Text = name
    SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    SliderLabel.Font = Enum.Font.Gotham
    SliderLabel.TextSize = 14
    SliderLabel.BackgroundTransparency = 1
    SliderLabel.Parent = SliderFrame

    local SliderBar = Instance.new("Frame")
    SliderBar.Size = UDim2.new(0.5, -5, 0, 5)
    SliderBar.Position = UDim2.new(0.5, 5, 0.5, -5)
    SliderBar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    SliderBar.Parent = SliderFrame

    local SliderIndicator = Instance.new("Frame")
    SliderIndicator.Size = UDim2.new(0, 0, 1, 0)
    SliderIndicator.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    SliderIndicator.Parent = SliderBar

    SliderBar.MouseButton1Down:Connect(function(input)
        local mousePos = input.Position.X
        local newSize = math.clamp(mousePos / SliderBar.AbsoluteSize.X, 0, 1)
        SliderIndicator.Size = UDim2.new(newSize, 0, 1, 0)
        callback(min + (max - min) * newSize)
    end)
end

-- Thêm một Dropdown vào Tab
function CreateDropdown(parent, name, options, callback)
    local DropdownFrame = Instance.new("Frame")
    DropdownFrame.Size = UDim2.new(1, 0, 0, 40)
    DropdownFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    DropdownFrame.Parent = parent

    local DropdownLabel = Instance.new("TextLabel")
    DropdownLabel.Size = UDim2.new(0.5, 0, 1, 0)
    DropdownLabel.Text = name
    DropdownLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    DropdownLabel.Font = Enum.Font.Gotham
    DropdownLabel.TextSize = 14
    DropdownLabel.BackgroundTransparency = 1
    DropdownLabel.Parent = DropdownFrame

    local DropdownButton = Instance.new("TextButton")
    DropdownButton.Size = UDim2.new(0.5, -5, 1, 0)
    DropdownButton.Position = UDim2.new(0.5, 5, 0, 0)
    DropdownButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    DropdownButton.Text = "Select"
    DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    DropdownButton.Font = Enum.Font.Gotham
    DropdownButton.TextSize = 14
    DropdownButton.Parent = DropdownFrame

    local DropdownList = Instance.new("Frame")
    DropdownList.Size = UDim2.new(1, 0, 0, 0)
    DropdownList.Position = UDim2.new(0, 0, 1, 0)
    DropdownList.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    DropdownList.Visible = false
    DropdownList.Parent = DropdownButton

    for _, option in ipairs(options) do
        local OptionButton = Instance.new("TextButton")
        OptionButton.Size = UDim2.new(1, 0, 0, 30)
        OptionButton.Text = option
        OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        OptionButton.Font = Enum.Font.Gotham
        OptionButton.TextSize = 14
        OptionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        OptionButton.Parent = DropdownList

        OptionButton.MouseButton1Click:Connect(function()
            DropdownButton.Text = option
            DropdownList.Visible = false
            callback(option)
        end)
    end

    DropdownButton.MouseButton1Click:Connect(function()
        DropdownList.Visible = not DropdownList.Visible
    end)
end

-- Thêm các phần tử vào tab
CreateButton(TabContent["Tab 1"], "Click Me", function() print("Button clicked!") end)
CreateToggle(TabContent["Tab 2"], "Enable Feature", true, function(state) print("Feature Enabled: " .. tostring(state)) end)
CreateSlider(TabContent["Tab 3"], "Adjust Value", 0, 100, function(value) print("Slider Value: " .. value) end)
CreateDropdown(TabContent["Tab 1"], "Choose Option", {"Option 1", "Option 2", "Option 3"}, function(choice) print("Dropdown Choice: " .. choice) end)

-- Hàm hiển thị thông báo
function CreateNotification(title, message, duration)
    -- Tạo Frame cho notification
    local Notification = Instance.new("Frame")
    Notification.Size = UDim2.new(0, 300, 0, 50)
    Notification.Position = UDim2.new(1, -310, 0, 10)
    Notification.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Notification.BorderSizePixel = 0
    Notification.Parent = MainFrame

    -- Tạo tiêu đề thông báo
    local NotificationTitle = Instance.new("TextLabel")
    NotificationTitle.Size = UDim2.new(1, 0, 0, 20)
    NotificationTitle.BackgroundTransparency = 1
    NotificationTitle.Text = title
    NotificationTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    NotificationTitle.Font = Enum.Font.Gotham
    NotificationTitle.TextSize = 14
    NotificationTitle.Parent = Notification

    -- Tạo nội dung thông báo
    local NotificationMessage = Instance.new("TextLabel")
    NotificationMessage.Size = UDim2.new(1, 0, 1, -20)
    NotificationMessage.Position = UDim2.new(0, 0, 0.2, 0)
    NotificationMessage.BackgroundTransparency = 1
    NotificationMessage.Text = message
    NotificationMessage.TextColor3 = Color3.fromRGB(200, 200, 200)
    NotificationMessage.Font = Enum.Font.Gotham
    NotificationMessage.TextSize = 12
    NotificationMessage.TextWrapped = true
    NotificationMessage.Parent = Notification

    -- Ẩn notification sau khoảng thời gian
    delay(duration or 5, function()
        Notification:TweenPosition(UDim2.new(1, 10, 0, 10), "Out", "Quad", 0.5, true)
        wait(0.5)
        Notification:Destroy()
    end)
end

-- Sử dụng thông báo
CreateNotification("Test Notification", "This is a notification example.", 3)

-- Hàm tạo Progress Bar
function CreateProgressBar(parent, name, maxValue)
    local ProgressBarFrame = Instance.new("Frame")
    ProgressBarFrame.Size = UDim2.new(1, 0, 0, 20)
    ProgressBarFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    ProgressBarFrame.Parent = parent

    local ProgressBarLabel = Instance.new("TextLabel")
    ProgressBarLabel.Size = UDim2.new(1, 0, 0, 20)
    ProgressBarLabel.BackgroundTransparency = 1
    ProgressBarLabel.Text = name
    ProgressBarLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    ProgressBarLabel.Font = Enum.Font.Gotham
    ProgressBarLabel.TextSize = 14
    ProgressBarLabel.TextWrapped = true
    ProgressBarLabel.Parent = ProgressBarFrame

    local ProgressBar = Instance.new("Frame")
    ProgressBar.Size = UDim2.new(0, 0, 1, 0)
    ProgressBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    ProgressBar.Parent = ProgressBarFrame

    -- Cập nhật tiến trình
    function ProgressBar:SetProgress(value)
        local progress = math.clamp(value / maxValue, 0, 1)
        self.Size = UDim2.new(progress, 0, 1, 0)
    end

    return ProgressBar
end

-- Sử dụng Progress Bar
local Progress = CreateProgressBar(TabContent["Tab 1"], "Loading", 100)
for i = 1, 100 do
    wait(0.1)
    Progress:SetProgress(i)
end

-- Hàm tạo Input Box
function CreateInputBox(parent, prompt, callback)
    local InputBoxFrame = Instance.new("Frame")
    InputBoxFrame.Size = UDim2.new(1, 0, 0, 40)
    InputBoxFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    InputBoxFrame.Parent = parent

    local InputLabel = Instance.new("TextLabel")
    InputLabel.Size = UDim2.new(0.5, 0, 1, 0)
    InputLabel.Text = prompt
    InputLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    InputLabel.Font = Enum.Font.Gotham
    InputLabel.TextSize = 14
    InputLabel.BackgroundTransparency = 1
    InputLabel.Parent = InputBoxFrame

    local TextBox = Instance.new("TextBox")
    TextBox.Size = UDim2.new(0.5, -5, 1, 0)
    TextBox.Position = UDim2.new(0.5, 5, 0, 0)
    TextBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.Font = Enum.Font.Gotham
    TextBox.TextSize = 14
    TextBox.ClearTextOnFocus = false
    TextBox.Parent = InputBoxFrame

    TextBox.FocusLost:Connect(function()
        callback(TextBox.Text)
    end)
end

-- Sử dụng Input Box
CreateInputBox(TabContent["Tab 2"], "Enter your name:", function(input)
    print("User input: " .. input)
end)

-- Hàm tạo Context Menu
function CreateContextMenu(parent, options)
    local ContextMenu = Instance.new("Frame")
    ContextMenu.Size = UDim2.new(0, 150, 0, 0)
    ContextMenu.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    ContextMenu.Visible = false
    ContextMenu.Parent = MainFrame

    -- Tạo các lựa chọn trong menu
    for _, option in pairs(options) do
        local OptionButton = Instance.new("TextButton")
        OptionButton.Size = UDim2.new(1, 0, 0, 30)
        OptionButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        OptionButton.Text = option
        OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        OptionButton.Font = Enum.Font.Gotham
        OptionButton.TextSize = 14
        OptionButton.Parent = ContextMenu

        OptionButton.MouseButton1Click:Connect(function()
            print("Selected: " .. option)
            ContextMenu.Visible = false
        end)
    end

    -- Hiển thị menu khi nhấp chuột phải
    parent.MouseButton2Click:Connect(function()
        ContextMenu.Position = UDim2.new(0, parent.AbsolutePosition.X, 0, parent.AbsolutePosition.Y)
        ContextMenu.Visible = true
    end)

    -- Ẩn menu khi nhấp ở bất kỳ đâu
    game:GetService("UserInputService").InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            ContextMenu.Visible = false
        end
    end)
end

-- Sử dụng Context Menu
CreateContextMenu(TabContent["Tab 3"], {"Option 1", "Option 2", "Option 3"})

function CreateColorPicker(parent, title, defaultColor, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0, 30)
    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Frame.Parent = parent

    local Label = Instance.new("TextLabel")
    Label.Text = title
    Label.Size = UDim2.new(0.7, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 14
    Label.Parent = Frame

    local ColorBox = Instance.new("TextButton")
    ColorBox.Size = UDim2.new(0.3, -5, 1, -4)
    ColorBox.Position = UDim2.new(0.7, 5, 0, 2)
    ColorBox.BackgroundColor3 = defaultColor
    ColorBox.Text = ""
    ColorBox.AutoButtonColor = false
    ColorBox.Parent = Frame

    local Picker = Instance.new("Color3Value")
    Picker.Value = defaultColor

    ColorBox.MouseButton1Click:Connect(function()
        -- Sử dụng thư viện có sẵn hoặc popup picker (có thể thêm sau)
        -- Tạm thời dùng preset màu
        local colors = {
            Color3.fromRGB(255, 0, 0),
            Color3.fromRGB(0, 255, 0),
            Color3.fromRGB(0, 0, 255),
            Color3.fromRGB(255, 255, 0),
            Color3.fromRGB(255, 255, 255)
        }

        local index = table.find(colors, Picker.Value) or 0
        index = index + 1
        if index > #colors then index = 1 end
        Picker.Value = colors[index]
        ColorBox.BackgroundColor3 = Picker.Value
        callback(Picker.Value)
    end)
end

function CreateKeybind(parent, title, defaultKey, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0, 30)
    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Frame.Parent = parent

    local Label = Instance.new("TextLabel")
    Label.Text = title
    Label.Size = UDim2.new(0.7, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 14
    Label.Parent = Frame

    local BindButton = Instance.new("TextButton")
    BindButton.Size = UDim2.new(0.3, -5, 1, -4)
    BindButton.Position = UDim2.new(0.7, 5, 0, 2)
    BindButton.Text = defaultKey.Name
    BindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    BindButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    BindButton.Parent = Frame

    local UserInputService = game:GetService("UserInputService")

    BindButton.MouseButton1Click:Connect(function()
        BindButton.Text = "..."
        local conn
        conn = UserInputService.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Keyboard then
                BindButton.Text = input.KeyCode.Name
                conn:Disconnect()
                callback(input.KeyCode)
            end
        end)
    end)
end

function MakeDraggable(frame, snapGrid)
    local UIS = game:GetService("UserInputService")
    local dragging, offset

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            offset = Vector2.new(input.Position.X - frame.AbsolutePosition.X, input.Position.Y - frame.AbsolutePosition.Y)
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local pos = input.Position - offset
            if snapGrid then
                pos = Vector2.new(math.floor(pos.X / snapGrid) * snapGrid, math.floor(pos.Y / snapGrid) * snapGrid)
            end
            frame.Position = UDim2.new(0, pos.X, 0, pos.Y)
        end
    end)

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

-- Ví dụ:
-- MakeDraggable(MainWindow, 10) -- snap 10px mỗi lần

local Themes = {
    Dark = {
        Background = Color3.fromRGB(30, 30, 30),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(0, 120, 255)
    },
    Light = {
        Background = Color3.fromRGB(245, 245, 245),
        Text = Color3.fromRGB(0, 0, 0),
        Accent = Color3.fromRGB(0, 120, 255)
    },
    Neon = {
        Background = Color3.fromRGB(15, 15, 20),
        Text = Color3.fromRGB(0, 255, 255),
        Accent = Color3.fromRGB(255, 0, 255)
    }
}

local CurrentTheme = Themes.Dark

function ApplyTheme(guiElements, themeName)
    local theme = Themes[themeName]
    if not theme then return end
    CurrentTheme = theme

    for _, element in ipairs(guiElements) do
        if element:IsA("TextLabel") or element:IsA("TextButton") then
            element.TextColor3 = theme.Text
        end
        if element:IsA("Frame") or element:IsA("ScrollingFrame") then
            element.BackgroundColor3 = theme.Background
        end
    end
end

function CreateTab(name, iconId)
    local tab = Instance.new("TextButton")
    tab.Size = UDim2.new(1, 0, 0, 40)
    tab.Text = "   " .. name
    tab.TextXAlignment = Enum.TextXAlignment.Left
    tab.Font = Enum.Font.GothamBold
    tab.TextSize = 16
    tab.TextColor3 = Color3.new(1, 1, 1)
    tab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

    if iconId then
        local icon = Instance.new("ImageLabel")
        icon.Image = "rbxassetid://" .. iconId
        icon.Size = UDim2.new(0, 20, 0, 20)
        icon.Position = UDim2.new(0, 10, 0.5, -10)
        icon.BackgroundTransparency = 1
        icon.Parent = tab
    end

    return tab
end

function CreateUserProfile(parent)
    local player = game.Players.LocalPlayer
    local profile = Instance.new("Frame")
    profile.Size = UDim2.new(1, 0, 0, 60)
    profile.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    profile.Parent = parent

    local avatar = Instance.new("ImageLabel")
    avatar.Size = UDim2.new(0, 40, 0, 40)
    avatar.Position = UDim2.new(0, 10, 0.5, -20)
    avatar.BackgroundTransparency = 1
    avatar.Parent = profile

    local name = Instance.new("TextLabel")
    name.Text = player.DisplayName
    name.TextColor3 = Color3.new(1, 1, 1)
    name.Font = Enum.Font.Gotham
    name.TextSize = 14
    name.Position = UDim2.new(0, 60, 0, 10)
    name.BackgroundTransparency = 1
    name.Size = UDim2.new(1, -60, 0, 20)
    name.Parent = profile

    -- Load avatar
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size100x100
    local content, _ = game.Players:GetUserThumbnailAsync(player.UserId, thumbType, thumbSize)
    avatar.Image = content
end

function CreateSearchBar(parent, elementsToFilter)
    local bar = Instance.new("TextBox")
    bar.PlaceholderText = "Search..."
    bar.Size = UDim2.new(1, -20, 0, 30)
    bar.Position = UDim2.new(0, 10, 0, 10)
    bar.Text = ""
    bar.TextColor3 = Color3.new(1, 1, 1)
    bar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    bar.ClearTextOnFocus = false
    bar.Parent = parent

    bar:GetPropertyChangedSignal("Text"):Connect(function()
        local text = bar.Text:lower()
        for _, element in ipairs(elementsToFilter) do
            local match = element.Name:lower():find(text)
            element.Visible = match ~= nil
        end
    end)
end

function AnimateCollapse(panel, collapse)
    local tweenService = game:GetService("TweenService")
    local goalSize = collapse and UDim2.new(1, 0, 0, 0) or UDim2.new(1, 0, 0, panel:GetAttribute("OriginalHeight"))
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

    local tween = tweenService:Create(panel, tweenInfo, {Size = goalSize})
    tween:Play()
end

function AddCollapsibleSection(parent, titleText)
    local section = Instance.new("Frame")
    section.Size = UDim2.new(1, 0, 0, 120)
    section:SetAttribute("OriginalHeight", 120)
    section.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    section.Parent = parent

    local header = Instance.new("TextButton")
    header.Size = UDim2.new(1, 0, 0, 30)
    header.Text = "+ " .. titleText
    header.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    header.TextColor3 = Color3.new(1, 1, 1)
    header.Parent = section

    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, 0, 1, -30)
    content.Position = UDim2.new(0, 0, 0, 30)
    content.BackgroundTransparency = 1
    content.Name = "Content"
    content.Parent = section

    local collapsed = false
    header.MouseButton1Click:Connect(function()
        collapsed = not collapsed
        header.Text = (collapsed and "+ " or "- ") .. titleText
        AnimateCollapse(section, collapsed)
    end)

    return content
end

local HttpService = game:GetService("HttpService")

function SaveSettings(data, key)
    local encoded = HttpService:JSONEncode(data)
    writefile("NNHub/" .. key .. ".json", encoded)
end

function LoadSettings(key)
    local path = "NNHub/" .. key .. ".json"
    if isfile(path) then
        local data = readfile(path)
        return HttpService:JSONDecode(data)
    end
    return {}
end

function CreatePopup(title, message, buttons)
    local popup = Instance.new("Frame")
    popup.Size = UDim2.new(0, 300, 0, 150)
    popup.Position = UDim2.new(0.5, -150, 0.5, -75)
    popup.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    popup.Parent = game.CoreGui

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Text = title
    titleLabel.Size = UDim2.new(1, 0, 0, 30)
    titleLabel.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 16
    titleLabel.Parent = popup

    local msgLabel = Instance.new("TextLabel")
    msgLabel.Text = message
    msgLabel.Size = UDim2.new(1, -20, 0, 70)
    msgLabel.Position = UDim2.new(0, 10, 0, 40)
    msgLabel.BackgroundTransparency = 1
    msgLabel.TextColor3 = Color3.new(1, 1, 1)
    msgLabel.TextWrapped = true
    msgLabel.Font = Enum.Font.Gotham
    msgLabel.TextSize = 14
    msgLabel.Parent = popup

    local buttonY = 115
    for i, btnData in ipairs(buttons) do
        local btn = Instance.new("TextButton")
        btn.Text = btnData.Text
        btn.Size = UDim2.new(0.5, -10, 0, 25)
        btn.Position = UDim2.new((i-1)*0.5, 5, 0, buttonY)
        btn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.Parent = popup

        btn.MouseButton1Click:Connect(function()
            btnData.Callback()
            popup:Destroy()
        end)
    end
end

function PlayUISound(soundId)
    local s = Instance.new("Sound")
    s.SoundId = "rbxassetid://" .. soundId
    s.Volume = 0.5
    s.PlayOnRemove = true
    s.Parent = workspace
    s:Destroy()
end

-- Gọi khi hover, click...
-- PlayUISound(9118823105) -- Example UI sound

function AddTooltip(target, text)
    local tooltip = Instance.new("TextLabel")
    tooltip.Size = UDim2.new(0, 200, 0, 25)
    tooltip.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    tooltip.TextColor3 = Color3.new(1, 1, 1)
    tooltip.Text = text
    tooltip.TextSize = 12
    tooltip.Visible = false
    tooltip.ZIndex = 10
    tooltip.Parent = game.CoreGui

    local UIS = game:GetService("UserInputService")
    target.MouseEnter:Connect(function()
        tooltip.Visible = true
        tooltip.Position = UDim2.new(0, UIS:GetMouseLocation().X + 10, 0, UIS:GetMouseLocation().Y)
    end)
    target.MouseLeave:Connect(function()
        tooltip.Visible = false
    end)
end

function MakeResponsive(uiElement)
    uiElement.Size = UDim2.new(0.25, 0, 0.4, 0)
    uiElement.AnchorPoint = Vector2.new(0.5, 0.5)
    uiElement.Position = UDim2.new(0.5, 0, 0.5, 0)

    local function resize()
        local screenSize = workspace.CurrentCamera.ViewportSize
        uiElement.Size = UDim2.new(0, math.clamp(screenSize.X * 0.25, 200, 500), 0, math.clamp(screenSize.Y * 0.4, 200, 500))
    end

    resize()
    game:GetService("RunService").RenderStepped:Connect(resize)
end
