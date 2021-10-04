--Crewphone SQL Reparado por Dmaskell92 y JS liberado por TGIANN 
Este script ha sido modificado para trabajar con PMA VOICE de FiveM y Onesync

Seguir las Instrucciones

--INSTALACION

1. Copiar todos los folders dentro de los recursos de FiveM
2. Importar la SQL del Crewphone FIX. Esto removera todas las tablas de otros crewphone asi que no hay necesidad de que
borres todo de la manera manual
3. Iniciar Recursos en el siguiente orden.

	start screenshot-basic
	start xsound
	start esx_addons_gcphone
	start gcphone
	
--REPARAR BUG DE NUMERO, CRYPTO Y PANTALLA BLANCA DE BANCO

1. Ir a tu es_extended dentro del folder y abrir el client.lua 
	Copiar el codigo de abajo y pegarlo en un evento que se active cuando inicies por primera vez

	TriggerServerEvent('crew:onPlayerLoaded', GetPlayerServerId(PlayerId()))
	TriggerServerEvent('crew:bankfix')
	
--EJEMPLO
AddEventHandler('esx:restoreLoadout', function()
	local playerPed = PlayerPedId()
	local ammoTypes = {}

	RemoveAllPedWeapons(playerPed, true)

	for k,v in ipairs(ESX.PlayerData.loadout) do
		local weaponName = v.name

		GiveWeaponToPed(playerPed, weaponName, 0, false, false)
		SetPedWeaponTintIndex(playerPed, weaponName, v.tintIndex)

		local ammoType = GetPedAmmoTypeFromWeapon(playerPed, weaponName)

		for k2,v2 in ipairs(v.components) do
			local componentHash = ESX.GetWeaponComponent(weaponName, v2).hash

			GiveWeaponComponentToPed(playerPed, weaponName, componentHash)
		end

		if not ammoTypes[ammoType] then
			AddAmmoToPed(playerPed, weaponName, v.ammo)
			ammoTypes[ammoType] = true
		end
	end
	
	TriggerServerEvent('crew:onPlayerLoaded', GetPlayerServerId(PlayerId()))
	TriggerServerEvent('crew:bankfix')
	
	isLoadoutLoaded = true
end)

-DE IGUAL FORMA YA SE COLOCO UN EXECUTECOMMAND DEL TELFIX DENTRO DEL CLIENT. 


--FOTOGRAFIAS EN TWITTER, PAGINAS AMARILLAS, MENSAJES.

SE CONFIGURO EL TELEFONO PARA QUE LOS WEBHOOKS LOS PUEDAS COLOCAR DIRECTOS EN EL CONFIG SIN TENER QUE IRTE A DIFERENTES LADOS DE LAS CARPETAS


NOTA: PARA EL SISTEMA DE UBER ES REQUISITO TENER TODOS LOS ITEMS EN TU DB. OBVIAMENTE PODRAS CAMBIARLOS CON LOS TUYOS.
PREFERENTEMENTE SERIA CON ITEMS QUE PUEDAS COMPRAR EN LAS TIENDAS.

NOTA 2: PARA EL SISTEMA DE NOTICIAS SOLO LOS REPORTEROS PUEDEN HACERLO Y TIENE QUE SER EN EL PUNTO MARCADO DEL CONFIG.

NOTA 3: EL TELEFONO FUE CONFIGURADO PARA PMA-VOICE. SI USAS MUMBLE SOLO CAMBIA POR MUMBLE VOIP. TODO LO DEMAS ES LO MISMO

NOTA 4: ESTE NO IMPLEMENTA LAS NOTIFICACIONES ESTILO NO PIXEL.

NOTA 5: LA APLICACION DE BUSQUEDA Y CAPTURA SOLO FUNCIONA CON UNAS TABLETS COMO LA ESX POLICE CAD O LA MDT DE YISUS. LA BUSQUEDA Y CAPTURA
SE COLOCA EN LA TABLET Y LA LISTA DEL TELEFONO SE DEBE ACTUALIZAR. POR DEFAULT ESTA DESACTIVADO.


