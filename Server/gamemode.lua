function GM:SetCurrentState(state)
    self.CurrentState = state
    print(state)
    Events:BroadcastRemote("ChangeState", {state})
end

function GM:SetMurder(ply)
    Events:CallRemote("SetMurderer", ply, {})
end