-----------------------------------------------------
-- Actor funcs
function CreateActor(amx, model, x, y, z, rotation)
	local actor = createPed(model, x, y, z, rotation, false)
	setElementData(actor, 'amx.actorped', true)
	return addElem(g_Actors, actor)
end

function DestroyActor(amx, actor)
	for i,playerdata in pairs(g_Players) do
		playerdata.streamedActors[getElemID(actor)] = nil
	end

	removeElem(g_Actors, actor)
	destroyElement(actor)
end

function IsActorStreamedIn(amx, actorId, player)
	return g_Players[getElemID(player)].streamedActors[actorId] ~= nil
end

function ApplyActorAnimation(amx, actor, animlib, animname, fDelta, loop, lockx, locky, freeze, time)
	setPedAnimation(actor, animlib, animname, time, loop, lockx or locky, false, freeze)
	setPedAnimationSpeed(actor, animname, fDelta)
end

function ClearActorAnimations(amx, actor)
	setPedAnimation(actor, false)
end

function SetActorFacingAngle(amx, actor, ang)
	local rotX, rotY, rotZ = getElementRotation(actor) -- get the local players's rotation
    setElementRotation(actor, rotX, rotY, ang, "default", true) -- turn the player 10 degrees clockwise
end

function GetActorFacingAngle(amx, actor, refAng)
	local rX, rY, rZ = getElementRotation(vehicle)
	writeMemFloat(amx, refAng, rZ)
end

-- stub
function SetActorInvulnerable(amx)
	return 1
end

-- stub
function IsActorInvulnerable(amx)
	return 1
end

function IsValidActor(amx, actorId)
	return g_Objects[actorId] ~= nil
end

GetActorHealth = GetPlayerHealth
GetActorVirtualWorld = GetPlayerVirtualWorld

function GetActorPoolSize(amx)
	local highestId = 0
	for id,v in pairs(g_Actors) do
		if id > highestId then
			highestId = id
		end
	end
	return highestId
end

SetActorHealth = SetPlayerHealth
SetActorPos = SetPlayerPos
SetActorVirtualWorld = SetPlayerVirtualWorld

-- stub
function GetPlayerCameraTargetActor(amx)
	return INVALID_ACTOR_ID
end