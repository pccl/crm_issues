var issues = {
  filter_by_bug: function(query, controller) {
    if (!this.request) {
      $("loading").show();
      $(controller).setStyle({ opacity: 0.4 });
      new Ajax.Request("/" + controller + "/search", {
        method      : "get",
        parameters  : { bug_ticket : query },
        onSuccess   : function() {
          $("loading").hide();
          $(controller).setStyle({ opacity: 1 });
        },
        onComplete  : (function() { this.request = nil; }).bind(this)
      });
    }
  }
}
