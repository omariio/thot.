Template.dashboard.helpers({
  getComments: function(_id){
    return Comments.find({target:_id});
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
