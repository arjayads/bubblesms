 
$(document).ready(function() {   
    $('#sendform').submit(false);
    
    $('#send').click(function(){
        $('#status').addClass("label label-inverse").html("Sending message . . .")
        var number = $('#mobile_no').val();
        var message = $('#message').val();
        $.ajax({
            type: "POST",
            url: "messageController",
            data: {number: number, message: message}
        }).done(function(msg) {
            setTimeout(function() {
                if (parseInt(msg) === 1)
                {
                    $('#status').removeClass().addClass("label label-success").html("&nbsp&nbspMessage sent.&nbsp&nbsp")
                }
                else
                {
                    $('#status').removeClass().addClass("label label-warning").html("&nbsp&nbspMessage sendin failed!&nbsp&nbsp")
                }
            }, 3000); 
        });   
    });
}); 