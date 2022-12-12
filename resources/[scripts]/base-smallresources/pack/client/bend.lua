local OPA = false

RegisterCommand('Agacharse',
    function()
        RequestAnimSet( "move_ped_crouched" )
        while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do 
            Citizen.Wait( 100 )
        end
        if (OPA == true) then 
            ResetPedMovementClipset( PlayerPedId(), 0 )
            OPA = false 
        elseif (OPA == false) then
            SetPedMovementClipset( PlayerPedId(), "move_ped_crouched", 0.25 )
            OPA = true 
        end 
    end
)

RegisterKeyMapping('Agacharse','Agacharse','keyboard','LCONTROL')