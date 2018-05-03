
/**
 * Created by DAMI_B on 16/05/2017.
 */
$(window).load(
    function (e) {
        $(".se-pre-con").delay(1200).fadeOut("slow");
    }
);

$(document).ready(function(){
    $("#valide").on('click',function(){
            switch ($("#emailaddress").val()){
                case "admin@ora.dz":
                    window.location.replace("admin/index.html");
                    break;
                case "doctor@ora.dz":
                    window.location.replace("praticien/index.html");
                    break;
                case "transport@ora.dz":
                    window.location.replace("transport/index.html");
                    break;
                default:   window.location.replace("pages-register.html");

            }
        }


    );
});

$(document).ready(function(){
    $("#addPatient").on('click',function () {
        formulaire();
    });
});
function formulaire(){
    bootbox.dialog({

            title: "Compl&#233;ter les informations suivantes :",
            message: '<div class="row">  ' +
            '<div class="col-md-12"> ' +
            '<form class="form-horizontal" id="form"  > ' +

            '<div class="form-group"> ' +
            '<label class="col-md-4 control-label" for="name">Nom</label> ' +
            '<div class="col-md-4"> ' +
            '<input id="name" name="name" type="text" placeholder=" Nom" class="form-control input-md" > ' +


            '</div> </div>' +
            '<div class="form-group"> ' +
            '<label class="col-md-4 control-label" for="forname">Prenom</label> ' +
            '<div class="col-md-4"> ' +
            '<input id="forname" name="forname" type="text" placeholder=" Prenom" class="form-control input-md" > ' +


            '</div> </div>' +
            '<div class="form-group"> ' +
            '<label class="col-md-4 control-label" for="phone">Num&#233;ro de t&#233;l&#233;phone</label> ' +
            '<div class="col-md-4"> ' +
            '<input id="phone" name="phone" type="text" placeholder="Numero de telephone" class="form-control input-md" > ' +

            '</div> </div>' +
            '<div class="form-group"> ' +
            '<label class="col-md-4 control-label" for="date">Date de d&#233;but</label> ' +
            '<div class="col-md-4"> ' +
            '<input id="date" name="date" type="datetime" placeholder=" Date de début de traitement" class="form-control input-md" > ' +
            '</div> </div>' +

            '<div class="form-group"> ' +
            '<label class="col-md-4 control-label" for="picture">Photo</label> ' +
            '<div class="col-md-4"> ' +
            '<input id="picture" name="picture" type="file" placeholder=" picture" class="form-control input-md" > ' +
            '</div> </div>' +

            '<button id="saveBatton" type="button" class="btn-success btn-rounded">Enregistrer</button>'+

            '</form> </div>  </div>',


        }


    );
    $("#saveBatton").on('click',addPatient);


};
function addPatient() {
    /* add element in the table of patient*/
    $("#idTabele").append('<tr>' +
        '<td>' +
        '<img src="../public/images/users/avatar-6.jpg" alt="contact-img" title="contact-img" class="img-circle thumb-sm">' +
        '</td>' +
        ' <td>'+
        $("#name").val()+
        '</td>'+

        '<td>'+
        '<a href="#" class="text-muted">'+$("#forname").val() +
        '</td>'+

        '<td>'+
        '<b><a href="" class="text-dark"><b>'+$("#phone").val()+'</b></a> </b>'+
        '</td>' +

        '<td>' +
        $("#date").val() +
        '</td>' +

        '</tr>');
    bootbox.hideAll();//hide the dialogue form

}
