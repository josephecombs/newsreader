/*global NewsReader JST*/
NewsReader.Views.FeedIndex = Backbone.View.extend({
  template: JST["feeds/index"],
  
  initialize: function() {
    this.listenTo(this.collection, "sync", this.render);
  },
  
  render: function () {
    var rC = this.template({ feeds: this.collection });
    this.$el.html(rC);
    
    return this;
  }
});