;(function HelperService(global, document) {
  var HelperService = {
    ready: function(fn) {
      // from youmightnotneedjquery.com
      if (document.readyState != 'loading'){
        fn();
      } else if (document.addEventListener) {
        document.addEventListener('DOMContentLoaded', fn);
      } else {
        document.attachEvent('onreadystatechange', function() {
          if (document.readyState != 'loading') fn();
        });
      }
    },
    addEventListener: function(el, eventName, handler) {
      if (el.addEventListener) {
        el.addEventListener(eventName, handler);
      } else {
        el.attachEvent('on' + eventName, function(){
          handler.call(el);
        });
      }
    }
  }

  global.App = global.App || {};
  global.App.HelperService = HelperService;
}(window, document));
