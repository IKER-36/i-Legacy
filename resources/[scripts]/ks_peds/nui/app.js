PEDS = {}

$('body').hide('slow')

window.addEventListener('message', (event) => {
	let data = event.data
    if (data.action == 'showPeds') {
        $('body').show('slow')
        data.peds.map(e => {
            !PEDS[e.ped] ? new Ped({ped: e.ped, type : e.type, name : e.label}) : console.log('ped exist')
        })        
    }
})

$('#Home').on('click', () => {
    $('body').hide('slow')
    $.post('https://ks_peds/close',JSON.stringify({}))
})


$('#default_ped').on('click', () => {
    $('body').hide('slow')
    $.post('https://ks_peds/default_ped',JSON.stringify({}))
})