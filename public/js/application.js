$(document).ready(function() {
  $("#guess").submit(function(event) { 
    event.preventDefault();
    var data = $(this).serialize();
    var url = this.action 
    var url2 = "/login"
    $.post(url, data, function(response) { 
      console.log( response.correctness )
        if(response.correctness === true) {
          $( "#question" ).animate( 
            {opacity: 0.1}, 
            'slow', 
            'swing',
            function() { $("#something").css( "color", "green" );
          });
          }
       else {
          $( "#question" ).animate( 
            {opacity: 0.1}, 
            'slow', 
            'swing',
            function() { $("#something").css( "color", "red" );
           });
        }
     });
   });
});  
  
