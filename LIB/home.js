(function(){
    var my = {};

    var regex = {
        /*
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

    //var scripts = document.getElementsByTagName("script");
    var scripts = document.scripts;
    for(var i = 0, j = scripts.length; i < j; i++){
        if(scripts[i].type === "text/javascript"){
            var customizedScript = scripts[i].innerHTML.trim();    
            analysisScripts(customizedScript);
        }
    }

    function analysisScripts(customizedScript){
        var comments = customizedScript.match(regex.comments);
        comments.forEach(function(comment, index, theArray){
            theArray[index] = comment.slice(2, -2).trim();
        });
        var codes = customizedScript.split(regex.comments);
        codes = codes.filter(function(item){
            return item.trim() !== ""; 
        });

        appendScripts(comments, codes);
    }

    function appendScripts(titles, codes){        
        if(titles.length !== codes.length){
            return;
        }

        for ( var i = 0, j = titles.length; i < j; i++){
            var title = titles[i];
            var code = codes[i];
            
            var html = "<pre><strong>{0}</strong></pre><pre class = 'codePanel prettyprint lang-js'><code>{1}</code></pre>";
            html = html.replace("{0}", title);
            html = html.replace("{1}", code);
                 
            $("#container").append(html);
        }
    }
}());
