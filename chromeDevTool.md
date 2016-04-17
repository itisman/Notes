console:
    - `$_` : result of last expression
    - `$0 $1 $2` : current/previous/before previous selected dom element
    - `copy($0)` : copy dom element
    - `$('img')` : document.querySelector('img')
    - `$$('img')` : document.querySelectorAll('img')
    - `debug(function)` : set debug point on function.
    - `dir(dom)` : list all the property for dom
    - `getEventListeners(object)` :  get all the events registed for the dom element
    - `monitor(fucntion)` : monitor function to see how many times called with what arguments
    - `monitorEvents(dom, ['click', 'touch')` : monitor event to see how many times called and who is the event target
    - `table(list)` : table view for array.

source:
    ctrl + p : file navigation
    ctrl + shift + o : function navigation
element:
    `h`: quick hide dom element
