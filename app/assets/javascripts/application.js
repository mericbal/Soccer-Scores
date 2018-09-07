// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require rails-ujs
//= require jquery
//= require popper
//= require bootstrap-sprockets



// nav bar scroll down 

$(document).ready(function(){
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a[class='scroller'], footer a[href='#myPage']").on('click', function(event) {

    // Prevent default anchor click behavior
    event.preventDefault();

    // Store hash
    var hash = this.hash;

    // Using jQuery's animate() method to add smooth page scroll
    // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
    $('html, body').animate({
      scrollTop: $(hash).offset().top
    }, 900, function(){
   
      // Add hash (#) to URL when done scrolling (default click behavior)
      window.location.hash = hash;
    });
  });
  
  // Slide in elements on scroll
  $(window).scroll(function() {
    $(".slideanim").each(function(){
      var pos = $(this).offset().top;

      var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
          $(this).addClass("slide");
        }
    });
  });

// Collapse Navbar
  var navbarCollapse = function() {
    if ($("#mainNav").offset().top > 100) {
      $("#mainNav").addClass("navbar-color");
    } else {
      $("#mainNav").removeClass("navbar-color");
    }
  };
  // Collapse now if page is not at top
  navbarCollapse();
  // Collapse the navbar when page is scrolled
  $(window).scroll(navbarCollapse);




// game form sliders

  var slider1 = document.getElementById("slider1");
  var output1 = document.getElementById("val1");
  output1.innerHTML = slider1.value;

  slider1.oninput = function() {
    output1.innerHTML = this.value;
  }

  var slider2 = document.getElementById("slider2");
  var output2 = document.getElementById("val2");
  output2.innerHTML = slider2.value;

  slider2.oninput = function() {
    output2.innerHTML = this.value;
  }

  // ?
  // var radio1 = document.getElementById("radio1");
  // var i1 = document.getElementById("i1");
  // tar1.innerHTML = 'Hometeam'

  // radio1.onclick = function() {
  //   tar1.innerHTML = i1.innerHTML
  // }
  
// end game fomr sliders











}) // end
// 