;(function(global, document) {
  var Users = {
    init: function init() {
      this.el = document.querySelectorAll('[data-controller="Users"]');
      this.select = this.el[0].querySelectorAll('[data-select]')[0];
      this.initSelect();
    },
    initSelect: function initSelect() {
      var choices = new Choices(this.select, {
        searchEnabled: false,
        itemSelectText: '',
        shouldSort: false
      });
    }
  }

  App.HelperService.ready(function() {
    if (document.querySelectorAll('[data-controller="Users"]').length) {
      Users.init();
    }
  });
}(window, document));
