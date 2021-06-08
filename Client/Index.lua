main_hud = WebUI("Main HUD", "file:///UI/index.html")

local eventqueue = {}
local isready = false

main_hud:Subscribe("Ready", function()
    for k, v in ipairs(eventqueue) do
        main_hud:CallEvent(v.name, v.params)
    end

    isready = true
end)

local function sendHudEvent(name, params)
    if isready then
        main_hud:CallEvent(name, params)
    else
        table.insert(eventqueue, {name = name, params = params})
    end
end

Events:Subscribe("ChangeState", function(state)
    GM.CurrentState = state
    print(state)
    sendHudEvent("ChangeState", {state})
end)

Events:Subscribe("SetMurderer", function()
    GM.Murderer = true
    sendHudEvent("SetMurderer", {true})
end)