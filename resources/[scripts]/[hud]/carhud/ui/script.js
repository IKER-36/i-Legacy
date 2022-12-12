$(() => {
    let carhud = document.getElementsByClassName('container');
    let count = document.getElementById('velocidad');
    let fuel = document.getElementById('gasolina');
    $(carhud).fadeOut(300);
   
    let Carhud = {}

    

    window.addEventListener("message", (event) => {
        let e = event.data;
        if (e.type === "carhud:show") {
            $(carhud).fadeIn(300)
            $(count).text(Math.round(e.velocity));
            $(fuel).text(Math.round(e.fuel))
           
            if (Math.round(e.velocity) <= 9) {
                $(count).text("00"+Math.round(e.velocity))
            } else if (Math.round(e.velocity) >= 9 && Math.round(e.velocity) <= 99) {
                $(count).text("0"+Math.round(e.velocity))
            }

            if (Math.round(e.velocity) === 0) {
                $(count).text("000");
                
                $('#gasolina').css('display','none');
                $('#L').css('display','none');
                $('#rectangulo').css('display','none');
                $('#velocidad').css('display','none');
                $('#gasolina-icon').css('display','none');
                $('#gasolina').css('display','none');
                $('#km').css('display','none');
                
            }else{
             
                $('#gasolina').css('display','block');
                $('#L').css('display','block');
                $('#rectangulo').css('display','block');
                $('#velocidad').css('display','block');
                $('#gasolina-icon').css('display','block');
                $('#gasolina').css('display','block');
                $('#km').css('display','block');
                
                
            } 
            
            if (Math.round(e.fuel) <= 99) {
                $('#gasolina').css('left','317%');
                $('#L').css('margin-left','331%');
                
            }
			if (Math.round(e.fuel) <= 9) {
                $('#gasolina').css('left','319%');
                $('#L').css('margin-left','331%');
                
            }
           
            


        } else if (e.type === "carhud:hide") {
            $(carhud).fadeOut(300)
        } 
    })
})