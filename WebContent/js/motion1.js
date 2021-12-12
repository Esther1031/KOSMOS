$(function(){

//아코디언패널

    $(".border_wrap>div>ul>li>ul").hide();
    $(".border_title").click(function(){

         if( $(this).next().css("display")=="none"){
            $(".border_wrap>div>ul>li>ul").slideUp(200);
            $(this).next().slideDown(200);
         }else{
            $(".border_wrap>div>ul>li>ul").slideUp(200);
            
         }
    });

});