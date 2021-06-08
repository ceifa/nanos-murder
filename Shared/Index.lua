GM = {}
GM.States = {
	WarmUp = 1,
	Waiting = 2,
	InProgress = 3,
	PostTime = 4,
}

function GM:GetCurrentState()
	return self.CurrentState or GM.States.WarmUp
end