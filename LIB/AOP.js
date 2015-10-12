(function() {
    var aspects = {
        before: function(target, method, advice, arg) {
            function _buildFunction(target, method, advice, arg) {
                var original = target[method];
                target[method] = function() {
                    (advice)(arg);
                    var returnValue = original.apply(target, arguments);
                    return returnValue;
                };
            }

            if (method) {
                _buildFunction(target, method, advice, arg);
            } else {
                for (var p in target) {
                    if (target.hasOwnProperty(p) && Object.prototype.toString.call(p) === '[object Function]') {
                        _buildFunction(target, p, advice, arg);
                    }
                }

            }

            return target;
        },
        after: function(target, method, advice, arg) {
            function _buildFunction(target, method, advice, arg) {
                var original = target[method];
                target[method] = function() {
                    var returnValue = original.apply(target, arguments);
                    (advice)(arg);
                    return returnValue;
                };
            }

            if (method) {
                _buildFunction(target, method, advice, arg);
            } else {
                for (var p in target) {
                    if (target.hasOwnProperty(p) && Object.prototype.toString.call(p) === '[object Function]') {
                        _buildFunction(target, p, advice, arg);
                    }
                }
            }
            return target;
        },
        around: function(target, method, advice, arg) {
            function _buildFunction(target, method, advice, arg) {
                var original = target[method];
                target[method] = function() {
                    (advice)(arg);
                    var returnValue = original.apply(target, arguments);
                    (advice)(arg);
                    return returnValue;
                };
            }

            if (method) {
                _buildFunction(target, method, advice, arg);
            } else {
                for (var p in target) {
                    if (target.hasOwnProperty(p) && Object.prototype.toString.call(p) === '[object Function]') {
                        _buildFunction(target, p, advice, arg);
                    }
                }
            }

            return target;
        },
        performancePlugin: function(target, option) {
            var i, j;
           
            function _buildFunction(target, method) {
                var original = target[method];
                target[method] = function() {
                    if (option && option.output && option.output.isNeedGroup === true) {
                        window.console.groupCollapsed(method);
                    }

                    var t0 = window.performance.now();
                    var returnValue = original.apply(target, arguments);
                    var t1 = window.performance.now();
                    window.console.info("Call [ " + method + ' ]: ' + (t1 - t0) + " milliseconds.");

                    if (option && option.output && option.output.isNeedGroup === true) {
                        window.console.groupEnd();
                    }

                    if (option && option.output && option.output.isNeedCount === true) {
                        window.console.count(method);
                    }
                    return returnValue;
                };
                target[method].isRegistered = true;
            }

            function _buildTarget() {
                for (var prop in target) {
                    if (Object.prototype.toString.call(target[prop]) === '[object Function]' && target[prop].isRegistered !== true &&
                        !(option && option.isNeedPrototypeFn === false && target.hasOwnProperty(prop) === false) &&
                        !(option && option.isNeedPrivateFn === false && prop.indexOf('_') === 0) &&
                        !(option && option.blackList && option.blackList.indexOf(prop) >= 0)) {
                        _buildFunction(target, prop);
                    }
                }
            }

            if (option) {
                if (Object.prototype.toString.call(option) === '[object String]') {
                    _buildFunction(target, option);
                } else if (Object.prototype.toString.call(option) === '[object Array]') {
                    for (i = 0, j = option.length; i < j; i++) {
                        _buildFunction(target, option[i]);
                    }
                } else if (Object.prototype.toString.call(option) === '[object Object]') {
                    if (option.whiteList && option.whiteList) {
                        for (i = 0, j = option.whiteList.length; i < j; i++) {
                            _buildFunction(target, option.whiteList[i]);
                        }
                    } else if (option.blackList && option.blackList) {
                        _buildTarget();
                    }
                }
            } else {
                _buildTarget();
            }

            return target;
        }
    };

    //Demo data
    function Target() {
        this.fn1 = function() {};
        this.fn2 = function() {};
        this.fn3 = function() {};
        this.fn4 = function() {};
        this.fn5 = function() {};
        this.fn6 = function() {};
        this.fn7 = function() {};
        this._fn8 = function() {};
        this._fn9 = function() {};
        this.propS = 'a';
        this.propA = [];
        this.propO = {};
    }


    Target.prototype.fn11 = function() {};
    Target.prototype.fn12 = function() {};
    Target.prototype.fn13 = function() {};
    Target.prototype.fn14 = function() {};
    Target.prototype.fn15 = function() {};
    Target.prototype.fn16 = function() {};
    Target.prototype.fn17 = function() {};
    Target.prototype.fn18 = function() {};
    Target.prototype.fn19 = function() {};

    var target = new Target();

    //normal function
    aspects.performancePlugin(target, 'fn1');

    //function in prototype
    aspects.performancePlugin(target, 'fn11');

    //passing array of funtions
    aspects.performancePlugin(target, ['fn2', 'fn12']);

    //passing object with white list
    aspects.performancePlugin(target, {
        whiteList: ['fn3', 'fn13']
    });

    //passing object with black list, and exclude prototype function and private function
    aspects.performancePlugin(target, {
        blackList: ['fn4', 'fn14', '_fn8', 'fn18', 'fn5', 'fn15', '_fn9', 'fn19', 'fn6', 'fn16'],
        isNeedPrototypeFn: false,
        isNeedPrivateFn: false
    });

    //passing object with black list, and include prototype function and private function
    aspects.performancePlugin(target, {
        blackList: ['fn4', 'fn14', '_fn8', 'fn18', 'fn5', 'fn15'],
        isNeedPrototypeFn: true,
        isNeedPrivateFn: true
    });

    //passing object with black list, include prototype function and private function, and output with group and count.
    aspects.performancePlugin(target, {
        blackList: ['fn4', 'fn14'],
        isNeedPrototypeFn: true,
        isNeedPrivateFn: true,
        output: {
            isNeedCount: true,
            isNeedGroup: true
        }
    });
    
    //plugin for all the functions in target.
    aspects.performancePlugin(target);


    //Test:
    //First time running
    for (var prop1 in target) {
        if (Object.prototype.toString.call(target[prop1]) === '[object Function]') {
            target[prop1]();
        }
    }

    //Second time running
    for (var prop2 in target) {
        if (Object.prototype.toString.call(target[prop2]) === '[object Function]') {
            target[prop2]();
        }
    }
})();
