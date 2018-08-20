

$(".apg").click(function(){

    $("#modapg").val("");
    $("#anapg").val("");
    e.preventDefault();
    $("#modal1").modal();

});


$("#hb1").click(function(){

    $("#home-b1").show();
    $("#profile-b1").hide();
    $("#profile-b2").hide();
    $("#profile-b3").show();

});

$("#pb1").click(function(){
    alert("helloooo");
    $("#home-b1").hide();
    $("#profile-b2").hide();
    $("#profile-b3").hide();
    $("#profile-b1").show();

});

$("#pb2").click(function(){

    $("#home-b1").hide();
    $("#profile-b1").hide();
    $("#profile-b3").hide();
    $("#profile-b2").show();

});

$("#pb3").click(function(){

    $("#home-b1").hide();
    $("#profile-b2").hide();
    $("#profile-b1").hide();
    $("#profile-b3").show();

});



$(".op").click(function(){

    $("#titre").val("");
    $("#auteurs").val("");
    $("#maison").val("");
    $("#anneeE").val("");
    $("#nb_pages").val("");
    e.preventDefault();
    $("#modal2").modal();
});


$(".ep").click(function(){

    e.preventDefault();
    $("#modal3").modal();
});


$(".asp").click(function(){

    e.preventDefault();
    $("#modal4").modal();
});

$(".asc").click(function(){

    e.preventDefault();
    $("#modal5").modal();
});


$(".as").click(function(){

    e.preventDefault();
    $("#modal7").modal();
});

$(".pr").click(function(){

    e.preventDefault();
    $("#modal6").modal();
});

$(".exp").click(function(){

    e.preventDefault();
    $("#modal8").modal();
});

$("#okOP").click(function(){
    window.location.href =window.location.href.replace('Enseignant/CV/OP','Enseignant/CV')
});