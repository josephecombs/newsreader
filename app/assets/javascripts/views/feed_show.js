/*global NewsReader JST */
NewsReader.Views.FeedShow = Backbone.View.extend({
  template: JST["feeds/show"],
  
  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(
      this.model.entries(), "sync and remove", this.render
    );
  },
  
  events: { 'click .refresh' : "refreshPage"},
  
  render: function() {
    if (!this.model) {
      return this;
    }
    var rC = this.template({ feed: this.model });
    this.$el.html(rC);
    
    var $entries = this.$el.find(".entries");
    this.model.entries().forEach(function(entry) {
      var entryShow = new NewsReader.Views.EntryShow({
        model: entry
      });
      $entries.append(entryShow.render().$el);
    });
    
    return this;
  },
  
  refreshPage: function () {
    this.model.fetch();
  }
});