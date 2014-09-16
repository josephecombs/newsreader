window.NewsReader = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new NewsReader.Routers.AppRouter($('#content'));
    Backbone.history.start();
  }
};

$(document).ready(function(){
  NewsReader.initialize();
});
