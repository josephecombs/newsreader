NewsReader.Views.EntryShow = Backbone.View.extend({
  template: JST["entry/show"],
  
  render: function() {
    var rC = this.template({ entry: this.model });
    this.$el.html(rC);
    
    return this;
  }
});