//回顶
$(document).ready(function() {
    //首先将#btn隐藏
    $("#top").hide();
    //当滚动条的位置处于距顶部50像素以下时，跳转链接出现，否则消失
    $(function() {
        $(window).scroll(function() {
            if ($(window).scrollTop() > 50) {
                $("#top").fadeIn(200);
            } else {
                $("#top").fadeOut(200);
            }
        });
        //当点击跳转链接后，回到页面顶部位置
        $("#top").click(function() {
            $('body,html').animate({
                    scrollTop: 0
                },
                500);
            return false;
        });
    });
});


//热门文章
$.post(
    "/article/popular",
    function (data) {

        $.each(data,function (i,a) {
            $("#popular").append('<a style="color: #000000" href="/article/lookArticle/'+a.aid+'" title="'+a.modifytime+'">'+a.title+'</a><br>');
        })
    },
    "json"
);

//标签云
$.post(
    "/tag/findAll",
    function (data) {
        $.each(data,function (i,t) {
            var name = "'"+t.tname+"'";
            $("#labels").append('<a onclick="findByTag('+name+')" style="color: #ffffff">'+t.tname+'</a>');
        })
    },
    "json"
);

//友情链接
$.post(
    "/links/findAll",
    function (data) {
        $.each(data,function (i,l) {
            $("#links").append('<a target="_blank" href="'+l.lurl+'" title="'+l.lname+'">'+l.lname+'</a>');
        })
    },
    "json"
);

/**
 * 数据渲染
 */
function dataRendering(data) {
    //回顶
    $('body,html').animate({
        scrollTop: 0
    },500);
    //删除除了第一个li的其余li
    $("#article>li").not(":eq(0)").remove();
    $.each(data,function (i,a) {
        $("#article").append(
            '<li class="cont-req2">' +
            '    <div class="lvti">' +
            '        <h2><a href="/article/lookArticle/'+a.aid+'">'+a.title+'</a></h2>' +
            '        <div id="text'+i+'">' +
            '           <textarea style="display:none;" placeholder="markdown">'+(a.text).substring(0,80)+"..."+'</textarea>' +
            '        </div>' +
            '        <ul class="entry-meta">' +
            '            <li>' +
            '               <i class="iconfont">&#xe8cb;</i>' +
            '               <a href="javascript:;">'+a.classify.cname+'</a>' +
            '            </li>' +
            '            <li>' +
            '               <i class="iconfont">&#xe8fa;</i>' +
            '               <a href="javascript:;">'+a.modifytime+'</a>' +
            '           </li>' +
            '           <li>' +
            '              <i class="iconfont">&#xe652;</i>' +
            '              <a href="javascript:;">'+a.userBase.userName+'</a>' +
            '           </li>' +
            '           <li>' +
            '              <i class="iconfont">&#xe8ea;</i>' +
            '              <a href="javascript:;">10</a>' +
            '           </li>' +
            '           <li>' +
            '              <i class="iconfont">&#xe7b3;</i>' +
            '              <a href="javascript:;">'+a.pageviews+'</a>' +
            '           </li>' +
            '           <li class="btn-Msg">' +
            '               <a href="/article/lookArticle/'+a.aid+'">阅读全文</a>\n' +
            '           </li>' +
            '       </ul>' +
            '    </div>' +
            '</li>'
        );
    });


    for(let i = 0;i < 10;i++){
        let testEditor;
        $(function () {
            testEditor = editormd.markdownToHTML("text"+i, {//注意：这里是上面DIV的id
                htmlDecode: "style,script,iframe",
                emoji: true,
                taskList: true,
                tocm: true,
                tex: true, // 默认不解析
                flowChart: true, // 默认不解析
                sequenceDiagram: true, // 默认不解析
                codeFold: true
            });
        });
    }
}

/**
 * 初始化分页控件
 */
function initPagination(pageNum,pages,functionType,val){
    $('#paginator').bootstrapPaginator({

        bootstrapMajorVersion: 3,//bootstrap版本

        alignment:"center",//设置控件的对齐方式

        currentPage: pageNum,//当前页码

        numberOfPages: 10,//设置显示的页码数

        totalPages: pages,//总页数（后台传过来的数据）


        itemTexts: function (type, page, current) {

            switch (type) {

                case "first": return "首页";

                case "prev": return "上一页";

                case "next": return "下一页";

                case "last": return "末页";

                case "page": return page;

            }

        },//改写分页按钮字样
        onPageClicked: function (event, originalEvent, type, page) {

            if (functionType == "findAllByState") {
                $.post(
                    "/article/findAllByState/",
                    {
                        "pageNum":page
                    },
                    function (data) {
                        dataRendering(data.list);
                    },
                    "json"
                );
            }
            if (functionType == "findByClassify") {
                $.post(
                    "/article/findByClassify",
                    {
                        "pageNum":page,
                        "cid":val
                    },
                    function (data) {
                        dataRendering(data.list);
                    },
                    "json"
                )
            }
            if (functionType == "search") {
                $.post(
                    "/article/search",
                    {
                        "pageNum":page,
                        "name":val
                    },
                    function (data) {
                        dataRendering(data.list);
                    },
                    "json"
                );
            }
            if (functionType == "findByTag") {
                $.post(
                    "/article/findByTag",
                    {
                        "pageNum":page,
                        "name":val
                    },
                    function (data) {
                        dataRendering(data.list);
                    },
                    "json"
                );
            }
            if (functionType == "bingImage") {
                $.post(
                    "/bingImage/findAll",
                    {
                        "pageNum":page,
                    },
                    function (data) {
                        dataRenderingImage(data.list);
                    },
                    "json"
                );
            }
        }

    });
}

/**
 * 分类查询
 */
function findByClassify(cid) {
    $.post(
        "/article/findByClassify",
        {
            "pageNum":1,
            "cid":cid
        },
        function (data) {
            if (data.total == 0){
                alert("无内容");
                return false;
            }
            dataRendering(data.list);
            initPagination(data.pageNum,data.pages,"findByClassify",cid);
        },
        "json"
    )
}

/**
 * 根据标签查询
 */
function findByTag(tag){
    $.post(
        "/article/findByTag",
        {
            "pageNum":1,
            "tag":tag
        },
        function (data) {
            if (data.total == 0){
                alert("无内容");
                return false;
            }
            dataRendering(data.list);
            initPagination(data.pageNum,data.pages,"findByTag",tag);
        },
        "json"
    );
}

/**
 * 搜索
 */
$("#search").click(function () {
    let name = $("#name").val();
    if (name == ""){
        alert("请输入具体的信息");
        return false;
    }
    $.post(
        "/article/search",
        {
            "pageNum":1,
            "name":name
        },
        function (data) {
            if (data.total == 0){
                alert("无内容");
                return false;
            }
            dataRendering(data.list);
            initPagination(data.pageNum,data.pages,"search",name);
        },
        "json"
    );
});

function dataRenderingImage(data){
    $("#image").empty();
    $.each(data,function (i,b) {
        $("#image").append('' +
            '<div class="col-md-3" style="margin-top: 30px">' +
            '<a target="view_window" title="'+b.bname+'" href="'+b.burl+'">' +
            '<img class="img-responsive" style="max-width: 100%;height: auto; display: block;" src="'+b.burl+'">' +
            '</a>' +
            '</div>');
    });


}



function findByClassifyArticle(cid) {

    window.location.href = "/";

    window.loaded=function () {
        
    }
}