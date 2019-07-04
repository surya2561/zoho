$(document).ready(function(){

    $check1=0;
    $check2=0;
    $check3=0;
    $check4=0;
    $(".product-introduction-wrapper .container .field--name-field-section-header .section-header .line-1 ").slideDown(1000);
    $var1=0;
    $var2=0;
    $(".hamburger").click(function(){
        $(".header-main .region-branding .menu--bayer-innovation-menu-mob .menu").css("background","#00617f");
        if($var1%2==0){
        $(".header-main .menu--bayer-innovation-menu-mob .menu").show();
        $(this).attr("src","data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' width='18' height='18'  viewBox='0 0 26 26'><path d='M1,1l24,24 M25,1L1,25' style='stroke:%230d2a40;fill:none;stroke-width:2;'/></svg>");
        $(".content .region-content .block-system-main-block").css("display","none");
        $(".footer").css("display","none");
        
    }
    else{
        $(".header-main .menu--bayer-innovation-menu-mob .menu").hide();
        $(this).attr("src","https://corpboip.test-bayer.acsitefactory.com/sites/g/files/kmftyc736/themes/site/docroot/themes/custom/bayer_corp_boip_basetheme/images/device-menu.png");
        $(".content .region-content .block-system-main-block").css("display","block");
        $(".footer").css("display","block");
        
    }
        $var1+=1;
    });
    $(".search").click(function(){
         $(".header-search").slideToggle();
      if($var2%2==0){
       
        $(this).attr("src","https://corpboip.test-bayer.acsitefactory.com/sites/g/files/kmftyc736/themes/site/docroot/themes/custom/bayer_corp_boip_basetheme/images/header-search-close-icon.png");
      }
      else{
           $(this).attr("src","https://corpboip.test-bayer.acsitefactory.com/sites/g/files/kmftyc736/themes/site/docroot/themes/custom/bayer_corp_boip_basetheme/images/search.png");
      }
      $var2+=1;
});

$(window).scroll(function() {
var scrollHeight = $(document).height();
var scrollPosition = $(window).height() + $(window).scrollTop();
var offset1=$(".paragraph--type--bayph-radlgy-p-prod-intro-1 .container .field--name-field-section-header .field--name-field-section-title p").offset();
var offset2=$(".paragraph--type--bayph-radlgy-p-prod-intro .container .field--name-field-section-header .field--name-field-section-title p").offset();
var offset3=$(".container-offering .field--name-field-section-title p").offset();
var offset4=$(".container-offering-1 .field--name-field-section-title p").offset();

//on -the pulse
if(offset1.top < scrollPosition ){
    $check1=0;
}
if($check1==0){
if(offset1.top < scrollPosition){
     
    $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-1 img").css("transition","all 0.9s ease-out 0s");
    $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-1 img").css("width","230px");
        $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-1 img").css("height","5px");
    $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-2 img").css("transition","all 0.9s ease-out 0s");
    $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-2 img").css("height","110px");
        $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-2 img").css("width","30px");
    $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-3 img").css("transition","all 0.9s ease-out 0s");
    $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-3 img").css("width","225px");
        $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-3 img").css("height","5px");
    $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-4 img").css("transition","all 0.9s ease-out 0s");
    $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-4 img").css("height","110px");
        $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-4 img").css("width","30px");

$check1=1;
}
}
else{
 $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-1 img").css("width","0px");
        $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-1 img").css("height","0px");
     $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-2 img").css("width","0px");
        $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-2 img").css("height","0px");
     $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-3 img").css("width","0px");
        $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-3 img").css("height","0px");
     $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-4 img").css("width","0px");
        $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-4 img").css("height","0px");
}
 //plug into lifehub network
if(offset2.top < scrollPosition ){
    $check2=0;
}
if($check2==0){
if(offset2.top < scrollPosition){
     
    $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-1 img").css("transition","all 0.9s ease-out 0s");
    $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-1 img").css("width","315px");
        $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-1 img").css("height","5px");
    $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-2 img").css("transition","all 0.9s ease-out 0s");
    $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-2 img").css("height","130px");
        $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-2 img").css("width","30px");
    $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-3 img").css("transition","all 0.9s ease-out 0s");
    $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-3 img").css("width","315px");
        $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-3 img").css("height","5px");
    $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-4 img").css("transition","all 0.9s ease-out 0s");
    $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-4 img").css("height","130px");
        $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-4 img").css("width","30px");

$check2=1;
}
}
else{
 $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-1 img").css("width","0px");
        $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-1 img").css("height","0px");
     $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-2 img").css("width","0px");
        $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-2 img").css("height","0px");
     $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-3 img").css("width","0px");
        $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-3 img").css("height","0px");
     $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-4 img").css("width","0px");
        $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-4 img").css("height","0px");
}
//whats the buzz
if(offset3.top < scrollPosition ){
    $check3=0;
}
if($check3==0){
if(offset3.top < scrollPosition+200){
     
    $(".container-offering .field--name-field-section-title .line-1 img").css("transition","all 0.9s ease-out 0s");
    $(".container-offering .field--name-field-section-title .line-1 img").css("width","250px");
        $(".container-offering .field--name-field-section-title .line-1 img").css("height","5px");
    $(".container-offering .field--name-field-section-title .line-2 img").css("transition","all 0.9s ease-out 0s");
    $(".container-offering .field--name-field-section-title .line-2 img").css("height","100px");
        $(".container-offering .field--name-field-section-title .line-2 img").css("width","30px");
    $(".container-offering .field--name-field-section-title .line-3 img").css("transition","all 0.9s ease-out 0s");
    $(".container-offering .field--name-field-section-title .line-3 img").css("width","245px");
        $(".container-offering .field--name-field-section-title .line-3 img").css("height","5px");
    $(".container-offering .field--name-field-section-title .line-4 img").css("transition","all 0.9s ease-out 0s");
    $(".container-offering .field--name-field-section-title .line-4 img").css("height","100px");
        $(".container-offering .field--name-field-section-title .line-4 img").css("width","30px");

$check3=1;
}
}
else{
 $(".container-offering .field--name-field-section-title .line-1 img").css("width","0px");
        $(".container-offering .field--name-field-section-title .line-1 img").css("height","0px");
     $(".container-offering .field--name-field-section-title .line-2 img").css("width","0px");
        $(".container-offering .field--name-field-section-title .line-2 img").css("height","0px");
     $(".container-offering .field--name-field-section-title .line-3 img").css("width","0px");
        $(".container-offering .field--name-field-section-title .line-3 img").css("height","0px");
     $(".container-offering .field--name-field-section-title .line-4 img").css("width","0px");
        $(".container-offering .field--name-field-section-title .line-4 img").css("height","0px");
}
//whats in for you
if(offset4.top < scrollPosition ){
    $check4=0;
}
if($check4==0){
if(offset4.top < scrollPosition){
     
    $(".container-offering-1 .field--name-field-section-title .line-1 img").css("transition","all 0.9s ease-out 0s");
    $(".container-offering-1 .field--name-field-section-title .line-1 img").css("width","230px");
        $(".container-offering-1 .field--name-field-section-title .line-1 img").css("height","5px");
    $(".container-offering-1 .field--name-field-section-title .line-2 img").css("transition","all 0.9s ease-out 0s");
    $(".container-offering-1 .field--name-field-section-title .line-2 img").css("height","130px");
        $(".container-offering-1 .field--name-field-section-title .line-2 img").css("width","30px");
    $(".container-offering-1 .field--name-field-section-title .line-3 img").css("transition","all 0.9s ease-out 0s");
    $(".container-offering-1 .field--name-field-section-title .line-3 img").css("width","225px");
        $(".container-offering-1 .field--name-field-section-title .line-3 img").css("height","5px");
    $(".container-offering-1 .field--name-field-section-title .line-4 img").css("transition","all 0.9s ease-out 0s");
    $(".container-offering-1 .field--name-field-section-title .line-4 img").css("height","130px");
        $(".container-offering-1 .field--name-field-section-title .line-4 img").css("width","30px");

$check4=1;
}
}
else{
 $(".container-offering-1 .field--name-field-section-title .line-1 img").css("width","0px");
        $(".container-offering-1 .field--name-field-section-title .line-1 img").css("height","0px");
     $(".container-offering-1 .field--name-field-section-title .line-2 img").css("width","0px");
        $(".container-offering-1 .field--name-field-section-title .line-2 img").css("height","0px");
     $(".container-offering-1 .field--name-field-section-title .line-3 img").css("width","0px");
        $(".container-offering-1 .field--name-field-section-title .line-3 img").css("height","0px");
     $(".container-offering-1 .field--name-field-section-title .line-4 img").css("width","0px");
        $(".container-offering-1 .field--name-field-section-title .line-4 img").css("height","0px");
}

});

});

