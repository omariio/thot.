Template.posts.helpers({
  photos: function(){
    return Photos.find().fetch();
  }
});

Template.posts.events({
  "click .like" : function(self){
    var picID = self.target.id.substr(2);
    Photos.update({_id:picID} ,  {$inc: { likes: 1} });
    $('div.animated').addClass('pulse');
  }
})

Template.dashboard.helpers({
  currentWeather:function(){
    var x = weatherData.feelslike_f;
    return x
  }
});

Template.dashboard.helpers({
  windy:function(){
      var y = weatherData.wind_string;
      return y
    }
});
