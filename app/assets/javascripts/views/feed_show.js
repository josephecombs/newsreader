/*global NewsReader JST */
NewsReader.Views.FeedShow = Backbone.View.extend({
  template: JST["feeds/show"],
  
  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },
  
  events: { 'click .refresh' : "refreshPage"},
  
  render: function() {
    if (!this.model) {
      return this;
    }
    var rC = this.template({ feed: this.model });
    this.$el.html(rC);
    
    return this;
  },
  
  refreshPage: function () {
    this.model.fetch();
  }
});