$(document).ready(function(){

    $(".product-introduction-wrapper .container .field--name-field-section-header .section-header .line-1 ").slideDown(1000);
    $var1=0;
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
        alert();
        $(".header-search").slideToggle();
    });
//on-the-pulse
    $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-1 img").css("transition","all 0.9s ease-out 0s");
    $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-1 img").css("width","230px");
    $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-2 img").css("transition","all 0.9s ease-out 0s");
    $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-2 img").css("height","110px");
    $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-3 img").css("transition","all 0.9s ease-out 0s");
    $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-3 img").css("width","225px");
    $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-4 img").css("transition","all 0.9s ease-out 0s");
    $(".paragraph--type--bayph-radlgy-p-prod-intro-1 .field--name-field-section-header .section-header .field--name-field-section-title .line-4 img").css("height","110px");
 //whats in it for you   
    $(".container-offering-1 .field--name-field-section-title .line-1 img").css("transition","all 0.9s ease-out 0s");
    $(".container-offering-1 .field--name-field-section-title .line-1 img").css("width","230px");
    $(".container-offering-1 .field--name-field-section-title .line-2 img").css("transition","all 0.9s ease-out 0s");
    $(".container-offering-1 .field--name-field-section-title .line-2 img").css("height","130px");
    $(".container-offering-1 .field--name-field-section-title .line-3 img").css("transition","all 0.9s ease-out 0s");
    $(".container-offering-1 .field--name-field-section-title .line-3 img").css("width","225px");
    $(".container-offering-1 .field--name-field-section-title .line-4 img").css("transition","all 0.9s ease-out 0s");
    $(".container-offering-1 .field--name-field-section-title .line-4 img").css("height","130px");

//plug into our life hub network

    $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-1 img").css("transition","all 0.9s ease-out 0s");
    $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-1 img").css("width","315px");
    $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-2 img").css("transition","all 0.9s ease-out 0s");
    $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-2 img").css("height","130px");
    $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-3 img").css("transition","all 0.9s ease-out 0s");
    $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-3 img").css("width","315px");
    $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-4 img").css("transition","all 0.9s ease-out 0s");
    $(".paragraph--type--bayph-radlgy-p-prod-intro .field--name-field-section-header .section-header .field--name-field-section-title .line-4 img").css("height","130px");

//whats the buzz
$(".container-offering .field--name-field-section-title .line-1 img").css("transition","all 0.9s ease-out 0s");
    $(".container-offering .field--name-field-section-title .line-1 img").css("width","250px");
    $(".container-offering .field--name-field-section-title .line-2 img").css("transition","all 0.9s ease-out 0s");
    $(".container-offering .field--name-field-section-title .line-2 img").css("height","100px");
    $(".container-offering .field--name-field-section-title .line-3 img").css("transition","all 0.9s ease-out 0s");
    $(".container-offering .field--name-field-section-title .line-3 img").css("width","245px");
    $(".container-offering .field--name-field-section-title .line-4 img").css("transition","all 0.9s ease-out 0s");
    $(".container-offering .field--name-field-section-title .line-4 img").css("height","100px");

});