$(function(){

  $('.btn-top').click(function(){
    $('html, body').animate({
      'scrollTop' : 0
    }, 'slow');
    return false;
  });

    $('header nav a').click(function(){
        var headerHight = 56;
        var id = $(this).attr('href');
        var position = $(id).offset().top - headerHight;
        $('html, body').animate({
          'scrollTop': position 
        }, 500);
        return false;
    });
});