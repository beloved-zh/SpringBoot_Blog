function header_nav() {
    $("#phone-show").click(function () {
        var nav=$("#header-nav");
        if(nav.is(":hidden")){
            nav.show();
        }else{
            nav.hide();
        }
    });

    var colors=['black','#7faeb1','#74b18e','#81b17b','#a9b179','#b1a069','#b18e6e','#b17d73','#b17786','#b1789c'
    ,'#9780b1','#8488b1','#7a9eb1','#29b1a9','#38b177','#8eb152'];
    function GetColorNumber(i='.8'){
        return 'rgba('+Math.floor(Math.random() * 255)+','+Math.floor(Math.random() * 255)+','+Math.floor(Math.random() * 255)+','+i+')';
    }
    /* 随机标签云 */
    $("#labels>a").each(function (i,t) {
        $(t).css('background-color',GetColorNumber());
        $(t).attr('title',$(t).html());
    });
    /* 随机友情链接 */
    $("#links>a").each(function (i,t) {
        $(t).css('background-color',GetColorNumber());
        $(t).attr('title',$(t).html());
    });
}

$(function () {
    header_nav();
});
