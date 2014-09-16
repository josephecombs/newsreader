/*global NewsReader */
NewsReader.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    "": "feedIndex"
  },
  
  initialize: function ($rootEl) {
    this.$rootEl = $rootEl;
    NewsReader.feeds = new NewsReader.Collections.Feeds();
    NewsReader.feeds.fetch();
  },
  
  feedIndex: function () {
    NewsReader.feeds.fetch();
    var feedView = new NewsReader.Views.feedIndex({
      collection: NewsReader.feeds
    });
    this._swapView(feedView);
  },
  
  _swapView: function (view) {
    if (this.currentView) {
      this.currentView.remove();
    }
    this.$rootEl.html(view.render().$el);
    
    this.currentView = view;
  }
});