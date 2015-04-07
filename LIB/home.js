(function(){
    'use strict';

    var my = {};

    var regex = {
        /*
         * comments is a regex can check javascript comments.
         *
         * Please ref: 
         * http://stackoverflow.com/questions/1979884/how-to-use-javascript-regex-over-multiple-lines
         * http://jsperf.com/javascript-multiline-regexp-workarounds
         *
         * comments : /\/\*.*?\*\//g 
         * comments : /\/\*[\s\S]*?\*\//g 
         *
         * E.g. \/* abc  *\/
         */
        comments : /\/\*[^]*?\*\//g  
    };

    $(window).load(function(){
        var scripts = document.scripts;
        for(var i = 0, j = scripts.length; i < j; i++){
            if(scripts[i].type === "text/javascript"){
                var customizedScript = scripts[i].innerHTML.trim();    
                analysisScripts(customizedScript);
            }
        }
    });
    
    function analysisScripts(customizedScript){
        var comments = customizedScript.match(regex.comments);
        if(comments && comments.length > 0){
            comments.forEach(function(comment, index, theArray){
                theArray[index] = comment.slice(2, -2).trim();
            });
        } else {
            comments = [];
        }
        var codes = customizedScript.split(regex.comments);
        //codes = codes.filter(function(item){
        //    return item.trim() !== ""; 
        //});

        appendScripts(comments, codes);
    }

    function appendScripts(titles, codes){        
        //if(titles.length !== codes.length){
        //    return;
        //}

        var html = "";

        for ( var i = 0, j = codes.length; i < j; i++){
            var title = titles[i];
            var code = codes[i];

            var codeHtml = "", 
                titleHtml = "";
            
            if(code !== undefined && code.trim() !== ""){
                codeHtml = "<pre class='codePanel prettyprint lang-js'><code class='language-js'>{1}</code></pre>";
                codeHtml = codeHtml.replace("{1}", code);
                html += codeHtml;
            }

            if(title !== undefined && title.trim() !== ""){
                titleHtml = "<pre class='content'>{0}</pre>";
                titleHtml = titleHtml.replace("{0}", title);
                html += titleHtml;
            }
        }
        $("#container").append(html);
    }

    //build scroll button and bind event
    function buildScrollButton(){
        //update for on top button
	    var box = document.createElement("div");
	    var inner = document.createElement("div");
	    var smallbox = document.createElement("div");
	    box.id = "scroll";
	    var eWarp = document.getElementById("container");
	    eWarp.appendChild(box);
	    //var script = document.getElementsByTagName("script")[0];
	    //document.body.insertBefore(box, script);
	    if (!window.XMLHttpRequest) {
	    	box.style.cssText = "_position:absolute;background-color:#555;width:40px;height:40px;right:50px;bottom:115px;cursor:pointer;display:none;";
	    } else {
	    	box.style.cssText = "background-color:#555;width:40px;height:40px;position:fixed;right:50px;bottom:115px;cursor:pointer;display:none;opacity: 0.7;";
	    }
	    inner.style.cssText = "height: 0;width: 0;border:14px solid #555;border-top: 0 none;border-bottom:14px solid #fff;position: relative;margin:8px 0 0 6px;";
	    smallbox.style.cssText = "width:8px;height:7px;position:absolute;top:14px;left:-4px;background-color:#fff;overflow: hidden;";
	    document.body.style.cssText = "background-image:url(about:blank);background-attachment:fixed;";
	    box.appendChild(inner);
	    inner.appendChild(smallbox);
    }

    buildScrollButton();
    var scroll = document.getElementById("scroll");
    var timer = null;
	window.onscroll = window.onmousewheel = document.onmousewheel = function() {
		//compatibility verify 
		var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
		if (scrollTop > 1000) {
			scroll.style.display = "block";
		} else {
			scroll.style.display = "none";
		}
		//implement (position: fixed) in IE browser -> using viewport height minus element height.
		//keep element at the absolute place in viewport
		if (!window.XMLHttpRequest) {
			var T = document.documentElement.clientHeight - scroll.offsetHeight - 20;
			scroll.style.top = scrollTop + T;
		}
	};
	scroll.onclick = function() {
		clearInterval(timer);
		var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
		timer = setInterval(function() {
			var speed = Math.floor(-scrollTop / 5);
			scrollTop = scrollTop + speed;
			
			document.documentElement.scrollTop = document.body.scrollTop = scrollTop;
			if (scrollTop === 0) {
				clearInterval(timer);
			}
		}, 30);
	};
}());
