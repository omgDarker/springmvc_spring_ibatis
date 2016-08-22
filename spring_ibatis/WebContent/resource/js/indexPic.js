document.writeln("<script type=\"text/javascript\" >BAIDU_CLB_SLOT_ID = \"586642\";</script>");
document.writeln("<script type=\"text/javascript\" src=\"http://cbjs.baidu.com/js/o.js\"></script>");
(function($) {
    $.fn.slideImg = function(settings) {
        settings = jQuery.extend({
            speed: "normal",
            timer: 1000
        }, settings);
        return this.each(function() {
            $.fn.slideImg.scllor($(this), settings);
        });
    };
    $.fn.slideImg.scllor = function($this, settings) {
        var index = 0;
        var scllorer = $(".img-box li", $this);
        var size = scllorer.size();
        var slideW = scllorer.outerWidth();
        var $selItem = $("<ul></ul>", {
            "class": "flash_item",
            html: function() {
                var $selItemHTML = "";
                if (size == 1) {
                    return;
                } else if (size > 1) {
                    for (var i = 0; i < size; i++) {
                        i == 0 ? $selItemHTML += '<li class="on">' : $selItemHTML += '<li class=""></li>';
                    }
                    return $selItemHTML;
                }
            }
        }).appendTo($this);
        var li = $(".flash_item li", $this);
        var showBox = $(".img-box", $this);
        var intervalTime = null;
        li.hover(function() {
            var that = this;
            if (intervalTime) {
                clearInterval(intervalTime);
            }
            intervalTime = setTimeout(function() {
                index = li.index(that);
                ShowAD(index);
            }, 200);
        }, function() {
            clearInterval(intervalTime);
            interval();
        });
        showBox.hover(function() {
            if (intervalTime) {
                clearInterval(intervalTime);
            }
        }, function() {
            clearInterval(intervalTime);
            interval();
        });
        function interval() {
            intervalTime = setInterval(function() {
                ShowAD(index);
                index++;
                if (index == size) {
                    index = 0;
                }
            }, settings.timer);
        }
        interval();
        var ShowAD = function(i) {
            showBox.animate({ "left": -i * slideW }, settings.speed);
            li.eq(i).addClass("on").siblings().removeClass("on");
        };
    };
})(jQuery);