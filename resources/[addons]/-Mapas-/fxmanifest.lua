fx_version 'bodacious'
game 'gta5'

author 'Iker'
description 'Pack Mapeados'
version '0.0'

this_is_a_map 'yes'

data_file 'TIMECYCLEMOD_FILE' 'gabz_mrpd/gabz_mrpd_timecycle.xml'
data_file 'INTERIOR_PROXY_ORDER_FILE' 'interiorproxies.meta'

files {
	'gabz_mrpd/gabz_mrpd_timecycle.xml',
	'interiorproxies.meta'
}

client_script {
    "gabz_mrpd/gabz_mrpd_entitysets.lua",
	"main.lua"
}