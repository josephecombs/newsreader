/*global NewsReader */
NewsReader.Collections.Feeds = Backbone.Collection.extend({
  model: NewsReader.Models.Feed,
  url: "api/feeds",
  
  getOrFetch: function (id) {
    var feeds = this;
    
    var item = this.get(id);
    if (!item) {
      item = new NewsReader.Models.Feed();
      item.set('id', id);
      item.fetch({
        success: function() {
          feeds.add(item);
        }
      });
    } else {
      item.fetch();
    }
    
    return item;
  }
});