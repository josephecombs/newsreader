/*global NewsReader JST*/
NewsReader.Views.FeedIndex = Backbone.View.extend({
  template: JST["feeds/index"],
  
  initialize: function() {
    this.listenTo(this.collection, "sync destroy", this.render);
  },
  
  events: {
    "click button.delete": "deleteFeed",
    "submit form": "newFeed"
  },
  
  render: function () {
    var rC = this.template({ feeds: this.collection });
    this.$el.html(rC);
    
    return this;
  },
  
  deleteFeed: function(event) {
    var $currentTarget = $(event.currentTarget);
    var id = $currentTarget.data("id");
    this.collection.get(id).destroy();
    this.collection.remove(id);
  },
  
  newFeed: function(event) {
    event.preventDefault();
    var view = this;
    
    var params = $(event.currentTarget).serializeJSON();
    var feed = new NewsReader.Models.Feed(params["feed"]);
    feed.save({}, {
      success: function() {
        view.collection.add(feed);
      }
    });
  }
});