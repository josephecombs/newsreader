/*global NewsReader */
NewsReader.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    "": "feedIndex",
    "feeds/:id": "feedShow"
  },
  
  initialize: function ($rootEl) {
    this.$rootEl = $rootEl;
    NewsReader.feeds = new NewsReader.Collections.Feeds();
    NewsReader.feeds.fetch();
  },
  
  feedIndex: function () {
    NewsReader.feeds.fetch();
    var feedView = new NewsReader.Views.FeedIndex({
      collection: NewsReader.feeds
    });
    this._swapView(feedView);
  },
  
  feedShow: function(id) {
    var feed = NewsReader.feeds.getOrFetch(id);
    var feedShowView = new NewsReader.Views.FeedShow({
      model: feed
    });
    this._swapView(feedShowView);
  },
  
  _swapView: function (view) {
    if (this.currentView) {
      this.currentView.remove();
    }
    this.$rootEl.html(view.render().$el);
    
    this.currentView = view;
  }
});