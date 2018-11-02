;
(function () {
    var Dpr = 1, uAgent = window.navigator.userAgent;
    var isIOS = uAgent.match(/iphone/i);
    var isYIXIN = uAgent.match(/yixin/i);
    var is2345 = uAgent.match(/Mb2345/i);
    var ishaosou = uAgent.match(/mso_app/i);
    var isSogou = uAgent.match(/sogoumobilebrowser/ig);
    var isLiebao = uAgent.match(/liebaofast/i);
    var isGnbr = uAgent.match(/GNBR/i);
    var wWidth = (screen.width > 0) ? (window.innerWidth >= screen.width || window.innerWidth == 0) ? screen.width : window.innerWidth : window.innerWidth, wDpr, wFsize;
    var wHeight = (screen.height > 0) ? (window.innerHeight >= screen.height || window.innerHeight == 0) ? screen.height : window.innerHeight : window.innerHeight;
    if (window.devicePixelRatio) {
        wDpr = window.devicePixelRatio;
    } else {
        wDpr = isIOS ? wWidth > 818 ? 3 : wWidth > 480 ? 2 : 1 : 1;
    }
    if (isIOS) {
        wWidth = screen.width;
        wHeight = screen.height;
    }
    // if(window.orientation==90||window.orientation==-90){
    //     wWidth = wHeight;
    // }else if((window.orientation==180||window.orientation==0)){
    // }
    if (wWidth > wHeight) {
        wWidth = wHeight;
    }
    wFsize = wWidth > 1080 ? 144 : wWidth / 6.4;
    wFsize = wFsize > 32 ? wFsize : 32;
    window.screenWidth_ = wWidth;
    if (isYIXIN || is2345 || ishaosou || isSogou || isLiebao || isGnbr) {//YIXIN 和 2345 这里有个刚调用系统浏览器时候的bug，需要一点延迟来获取
        setTimeout(function () {
            wWidth = (screen.width > 0) ? (window.innerWidth >= screen.width || window.innerWidth == 0) ? screen.width : window.innerWidth : window.innerWidth;
            wHeight = (screen.height > 0) ? (window.innerHeight >= screen.height || window.innerHeight == 0) ? screen.height : window.innerHeight : window.innerHeight;
            wFsize = wWidth > 1080 ? 144 : wWidth / 6.4;
            wFsize = wFsize > 32 ? wFsize : 32;
            // document.getElementsByTagName('html')[0].dataset.dpr = wDpr;
            document.getElementsByTagName('html')[0].style.fontSize = wFsize + 'px';
        }, 500);
    } else {
        // document.getElementsByTagName('html')[0].dataset.dpr = wDpr;
        document.getElementsByTagName('html')[0].style.fontSize = wFsize + 'px';
    }
    // alert("fz="+wFsize+";dpr="+window.devicePixelRatio+";UA="+uAgent+";width="+wWidth+";sw="+screen.width+";wiw="+window.innerWidth+";wsw="+window.screen.width+window.screen.availWidth);
})()

var commonObj = {
    initPage: function () {
        var _this = this;
        $(".g_zhezhao,.g_leftNav,.tip_zhezhao,.m_searchDialog").on("touchmove", function (e) {
            e.preventDefault()
        });
        $(".leftnavbtn").on("click",function(){
            $(".g_zhezhao").show();
            $(".g_leftNav").show();
            $(".g_zhezhao").removeClass("fadeOutLeft");
            $(".g_leftNav").removeClass("fadeOutLeft");
            $(".g_leftNav").addClass("fadeInLeft");
        });
        $(".g_zhezhao").on("click",function(){
            $(".g_leftNav").removeClass("fadeInLeft");
            $(".g_zhezhao").addClass("fadeOutLeft");
            $(".g_leftNav").addClass("fadeOutLeft");
            setTimeout(function(){$(".g_zhezhao").hide();$(".g_leftNav").hide();},500)
        });
        //专家退出按钮点击效果
        $("#zj_loginout").on("click",function(){
            $(".tip_zhezhao").show();
            $(".g_dialog").show();
        });
        //专家退出提示取消
        $("#g_concel").on("click",function(){
            $(".tip_zhezhao").hide();
            $(".g_dialog").hide();
        });
        //专家确认退出
        $("#g_confrim").on("click",function(){

            //书写退出逻辑


            $(".tip_zhezhao").hide();
            $(".g_dialog").hide();
        });
        //搜索弹框
        $(".rightsearchbtn").on("click",function(){
            $(".m_searchDialog").show();
            $("#topsearchinput").focus();
        });
        //取消搜索
        $(".searchbtn").on("click",function(){
           $(".m_searchDialog").hide();
        });

        //我的-个人中心里面滚动固定
    $(window).scroll(function () {
        var scrollTop = $(window).scrollTop();
        if (typeof $("#statusbar")[0] != 'undefined') {
            var offsettop =parseInt($(".topbar").height())+parseInt($("#statusbar").prev().height());
            if (scrollTop >= offsettop) {
                if (!$("#statusbar").hasClass("topfixedpc")) {
                    $("#statusbar").addClass("topfixedpc");
                }
            } else {
                $("#statusbar").removeClass("topfixedpc")
            }
        }
    });


    }
}



var scrollNextObj = {

    moreUrl: "", //下拉分页更多的url
    ajaxstatus: true,
    fenyestatus: true,
    pageData: {}, //下拉分页传输的data
    appendId: "", //下拉分页append的父级ID
    scrollNextPage: function () {
        var _this = this;
//        console.log(3333);
        // $(window).scroll(_this.scrollFn);
        $(window).on("touchmove", _this.scrollFn);

    },
    scrollFn: function () {
        var clientHeight = $(window).height();
        var wholeHeight = $(document).height();
        var scrollTopHeight = $(window).scrollTop();
        if (clientHeight + scrollTopHeight + 50 >= wholeHeight && scrollNextObj.ajaxstatus) {
            if (scrollNextObj.fenyestatus) {
                scrollNextObj.ajaxstatus = false;
                $(".loaddiv").show();
                $.ajax({
                    url: scrollNextObj.moreUrl,
                    type: "post",
                    dataType: "json",
                    data: scrollNextObj.pageData,
                    success: function (res) {
                        scrollNextObj.searchCallBack(res);
                    }
                })
            } else {
                return
            }
        }
    },
    searchCallBack: function (obj) {
    }
}
$(commonObj.initPage)
$(function(){
	$('.api_btn').click(function(){
		var url = $(this).attr('href') || $(this).data('url');
		var showret = $(this).data('showret');
		var isReload = $(this).data('reload');
		var msg = $(this).data('msg');
		var target = $(this).data('target');
		var cfm = true;
		if (msg) {
			if (! confirm(msg)) {
				cfm = false;
			}
		}
		if (cfm) {
			$.get(url, function(ret){
				if (showret) {
					alert(ret.data);
				}
				if (ret.status) {
					if (isReload) {
						location.reload();
					}
					if (target) {
						$(target).val(ret.data);
						$(target).html(ret.data);
					}
				}
			}, 'json');
		}
		
		return false;
	});
});

