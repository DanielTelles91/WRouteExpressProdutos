// JavaScript Document

$(window).load(function () {

})


// Dropdown on Mouseover
$('document').ready(function () {

    $('.dropdown').hover(
            function () {
                $(this).addClass('open')

            },
            function () {
                $(this).removeClass('open')
            }

    );








    $('.clostalert').click(function ()
    {

        $(this).parent('.alert').fadeOut()
    });
});


// Category Menu mobile
$("<select />").appendTo("nav.subnav");

// Create default option "Go to..."
$("<option />", {
    "selected": "selected",
    "value": "",
    "text": "Go to..."
}).appendTo("nav.subnav select");

// Populate dropdown with menu items
$("nav.subnav a").each(function () {
    var el = $(this);
    $("<option />", {
        "value": el.attr("href"),
        "text": el.text()
    }).appendTo("nav.subnav select");
});

// To make dropdown actually work
// To make more unobtrusive: http://css-tricks.com/4064-unobtrusive-page-changer/
$("nav.subnav select").change(function () {
    window.location = $(this).find("option:selected").val();
});






$(window).scroll(function () {
    if ($(this).scrollTop() > 50) {
        $('#gotop').fadeIn(500);
    } else {
        $('#gotop').fadeOut(500);
    }
});


$('#gotop').click(function () {
    $('html, body').animate({scrollTop: 0}, 2200);
});









	  