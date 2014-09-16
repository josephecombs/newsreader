NewsReader.Collections.Entries = Backbone.Collection.extend ({
  url: function () {
    
    return this.feed.url() + '/entries';
  },
  
  initialize: function (feed) {
    this.feed = feed;
  },
  
  model: NewsReader.Models.Entry
  
  
  
})