class Ped {

    constructor( {ped, type, name} ){

        this.name          = name
        this.container     = $("#container")
        this.ped           = ped
        PEDS[this.ped] = true

        this.icon = type == "Ped" ? 'fa-person' : 'fa-dog'
        this.htmlTemplate  = `
            <button id=${this.ped} class="bg-slate-900 w-50 hover:bg-blue-800 text-white py-2 px-4 rounded m-3 flex flex-row items-center h-70 w-full justify-between overflow-hidden">
                <i class="fa-solid ${this.icon} text-2xl"></i>
                <span id="deposito2 m-5 text-right">Ped-${name}</span>
            </button>
        `

        this.container.append(this.htmlTemplate)
        this.playButton = $(`#${this.ped}`)
        this.playButton.on('click', () => {
            $.post('https://ks_peds/setPed',JSON.stringify({ped : this.ped, name : this.ped, type : this.type}))
            $('body').hide('slow')
        })

    }

}
