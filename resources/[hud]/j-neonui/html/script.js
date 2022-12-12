$(function(){
    $("body").css({"overflow":"hidden"})
    // AddEventListener
    window.addEventListener("message", function(event){
        let data = event.data;

        if (data.inVeh) {
            $("#statusHud").css({"left": "16vw"})
        } else {
            $("#statusHud").css({"left": "0vw"})
        }

        if (data.useLogo) {
            $("#serverLogo").fadeIn(300)
            $("#serverLogo").html(`<img src="${data.logo}" id ="serverLogo">`)
        } else if (!!data.useLogo) {
            $("#serverLogo").fadeOut(300)
        }

        if (data.cinemaMode &&!data.inVehicle) {
            $(".cinMaContainer").css({"height": "5vw"})
            setTimeout(function(){
                $("#serverLogo").css({"top": "4vw", "transform": "scale(1.3)"})
                $("#statusHud").css({"left": "-15vw"})
                setTimeout(function(){
                    $("#statusHud").fadeOut(300)
                }, 200)
            })
        } else if (data.inVehicle) {
            $(".cinMaContainer").css({"height": "5vw"})
            setTimeout(function(){
                $("#serverLogo").css({"top": "4vw", "transform": "scale(1.3)"})
                $("#statusHud").css({"left": "-95vw"})
                setTimeout(function(){
                    $("#statusHud").fadeOut(300)
                }, 200)
            })
        } else if (data.cinemaMode == false) {
            $(".cinMaContainer").css({"height": "0vw"})
            setTimeout(function(){
                $("#serverLogo").css({"top": "1vw", "transform": "scale(1)"})
                $("#statusHud").css({"left":"-15vw"})
                setTimeout(function(){
                    $("#statusHud").fadeIn(300)  
                }, 300)
                setTimeout(function(){
                    $("#statusHud").css({"left": "0vw"})
                }, 500)
            })
        }

        if (data.whenUse) {
            if (Math.round(data.health) > 50) {
                $("#health").hide(300)
            } else if (Math.round(data.health) < 50) {
                $("#health").show(300)
            }
            if (Math.round(data.shield) > 50) {
                $("#shield").show(300)
            } else if (Math.round(data.shield) < 50) {
                $("#shield").hide(300)
            }
            if (Math.round(data.hunger) > 50) {
                $("#hunger").hide(300)
            } else if (Math.round(data.hunger) < 50) {
                $("#hunger").show(300)
            }
            if (Math.round(data.thirst) > 50) {
                $("#thirst").hide(300)
            } else if (Math.round(data.thirst) < 50) {
                $("#thirst").show(300)
            }
        }

        $("#healthBar").css({"height": Math.round(data.health) + "%"});
        $("#shieldBar").css({"height": Math.round(data.shield) + "%"});
        $("#hungerBar").css({"height": Math.round(data.hunger) + "%"});
        $("#thirstBar").css({"height": Math.round(data.thirst) + "%"});
    })
})