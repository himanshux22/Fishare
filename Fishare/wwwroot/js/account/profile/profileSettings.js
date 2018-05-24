﻿$(function () {
    $('.post-using-ajax').each(function() {
        var $frm = $(this);
        $frm.submit(function(e) {
            e.preventDefault();

            //getting form into Jquery Wrapper Instance to enable JQuery Functions on form                    
            var form = $frm;

            //Serializing all For Input Values (not files!) in an Array Collection so that we can iterate this collection later.
            var params = form.serializeArray();

            //Declaring new Form Data Instance  
            var formData = new FormData();


            //Now Looping the parameters for all form input fields and assigning them as Name Value pairs. 
            $(params).each(function (index, element) {
                formData.append(element.name, element.value);
            });

            //Append data so the controller knows its an settings ajaxcall
            formData.append('settingsCall', 'True');

            $.ajax({
                type: $frm.attr('method'),
                url: $frm.attr('action'),
                data: formData,
                contentType: false,
                processData: false,
                dataType: 'html',
                success: function (data) {
                    $('#AccountSettings').modal('hide');
                    $("#ProfilePage").html(data);
                    $('#AccountSettings').modal('show');
                    console.log(data);
                    alert(settingsCall);
                }
            });
        });
    });
});
