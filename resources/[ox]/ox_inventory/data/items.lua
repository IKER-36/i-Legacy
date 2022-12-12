return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			}
		},
		consume = 0.3
	},

	['bandage'] = {
		label = 'Vendaje',
		-- label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['bag'] = {
		label = 'Mochila',
		-- label = 'Bag',
		weight = 0,
		stack = false,
		close = true,
		description = ''
	},

	['black_money'] = {
		label = 'Dinero Negro',
		-- label = 'Dirty Money',
	},

	['burger'] = {
		label = 'Hamburguesa',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'Te comiste una hamburguesa, vigila la dieta...'
		},
	},

	['cola'] = {
		label = 'Coca-Cola',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'Apagaste tu sed con cola'
		}
	},

	['parachute'] = {
		label = 'Paracaidas',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Basura',
	},

	['paperbag'] = {
		label = 'Bolsa de Papel',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Ganzúa',
		weight = 160,
	},

	['phone'] = {
		label = 'iPhone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Dinero',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Agua',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Mastercard',
		stack = false,
		weight = 10,
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},

	['alive_chicken'] = {
		label = 'Pollo Vivo',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['blowpipe'] = {
		label = 'Blowtorch',
		weight = 2,
		stack = true,
		close = true,
		description = nil
	},

	['bread'] = {
		label = 'Pan Bimbo',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['cannabis'] = {
		label = 'Canabis',
		weight = 3,
		stack = true,
		close = true,
		description = nil
	},

	['carokit'] = {
		label = 'BodyKit',
		weight = 3,
		stack = true,
		close = true,
		description = nil
	},

	['carotool'] = {
		label = 'Herramientas',
		weight = 2,
		stack = true,
		close = true,
		description = nil
	},

	['clothe'] = {
		label = 'Cloth',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['copper'] = {
		label = 'Copper',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['cutted_wood'] = {
		label = 'Madera Cortada',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['diamond'] = {
		label = 'Diamante',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['emerald'] = {
		label = 'Esmeralda',
		weight = 20,
		stack = true,
		close = true,
		description = nil
	},

	['essence'] = {
		label = 'Gas',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['fabric'] = {
		label = 'Fabric',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['fish'] = {
		label = 'Pescado',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['fixkit'] = {
		label = 'Kit Reparación',
		weight = 3,
		stack = true,
		close = true,
		description = nil
	},

	['fixtool'] = {
		label = 'Kit Reparacion',
		weight = 2,
		stack = true,
		close = true,
		description = nil
	},

	['gazbottle'] = {
		label = 'Gas Bottle',
		weight = 2,
		stack = true,
		close = true,
		description = nil
	},

	['gold'] = {
		label = 'Oro',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['iron'] = {
		label = 'Acero',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['marijuana'] = {
		label = 'Marihuana',
		weight = 2,
		stack = true,
		close = true,
		description = nil
	},

	['medikit'] = {
		label = 'Desfibrilador',
		weight = 2,
		stack = true,
		close = true,
		description = nil
	},

	['packaged_chicken'] = {
		label = 'Pollo Fileteado',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['packaged_plank'] = {
		label = 'Packaged wood',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['petrol'] = {
		label = 'Aceite',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['petrol_raffin'] = {
		label = 'Processed oil',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['pickaxe'] = {
		label = 'Pico de Mineria',
		weight = 2,
		stack = true,
		close = true,
		description = nil
	},

	['slaughtered_chicken'] = {
		label = 'Slaughtered chicken',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['steel'] = {
		label = 'Metal',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['stone'] = {
		label = 'Piedra',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['washed_stone'] = {
		label = 'Washed stone',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['wood'] = {
		label = 'Wood',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['wool'] = {
		label = 'Wool',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['anchovy'] = {
		label = 'Anchovy',
		weight = 20,
		stack = true,
		close = true,
		description = nil
	},

	['fishbait'] = {
		label = 'Fish Bait',
		weight = 20,
		stack = true,
		close = true,
		description = nil
	},

	['keys'] = {
		label = 'Vehicle Key',
		weight = 0,
		stack = false,
		close = true,
		description = 'Vehicle Key'
	},

	['fishingrod'] = {
		label = 'Fishing Rod',
		weight = 20,
		stack = true,
		close = true,
		description = nil
	},

	['salmon'] = {
		label = 'Salmon',
		weight = 20,
		stack = true,
		close = true,
		description = nil
	},

	['tuna'] = {
		label = 'Tuna',
		weight = 40,
		stack = true,
		close = true,
		description = nil
	},

	['trout'] = {
		label = 'Trout',
		weight = 20,
		stack = true,
		close = true,
		description = nil
	},
}