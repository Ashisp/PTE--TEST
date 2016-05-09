/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function startTimer(duration, start) {
    var timer = start, minutes, seconds;
    var display = document.querySelector('#time');
    var elapsedTime = document.getElementById("elapsedTime");
    var durationDisplay = document.querySelector("#duration");
    
    minutes = parseInt(parseInt(duration) / 60, 10);
    seconds = parseInt(parseInt(duration) % 60, 10);
    
    minutes = minutes < 10 ? "0" + minutes : minutes;
    seconds = seconds < 10 ? "0" + seconds : seconds;
    durationDisplay.textContent = minutes + ":" + seconds;
    
    setInterval(function () {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;
        elapsedTime.value = timer;
        if (++timer > duration) {
            timer = duration;
        }
        //alert("Timer: " + timer);
    }, 1000);
}

/*window.onload = function () {
 var fiveMinutes = 60 * 5;
 startTimer(twoMinutes);
 };*/