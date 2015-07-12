
  var selectedMarkerId = new ReactiveVar(null);

  Tracker.autorun(function(){
    selectedMarkerId.set(Session.get("currentPhoto"));
  });

  Template.addPost.events ({
    'click #picture': function(){
      MeteorCamera.getPicture(function(error, data){
        if (! error) {
          onSuccess(data);
        }
      });
    }
  });

  Template.posts.helpers({
    photos: function(){
      return Photos.find().fetch();
    },
    markers: function() {
      return Photos.find()
    },
    selectedMarkerId: selectedMarkerId
  });

  Template.posts.events({
    "click .like" : function(self){
      var picID = self.target.id.substr(2);
      Photos.update({_id:picID} ,  {$inc: { likes: 1} });
      $('div.animated').addClass('pulse');
    }
  });

  var onSuccess = function(imageData){
    // console.log(Geolocation.currentLocation());

    navigator.geolocation.getCurrentPosition(function(position) {
      Photos.insert({
        image: imageData,
        createdAt: new Date,
        likes: 0,
        marker: {
          lat: position.coords.latitude,
          lng: position.coords.longitude,
          infoWindowContent: "<img width='100' src='" + imageData + "' />"
        }
      });
    });
//   do_something(position.coords.latitude, position.coords.longitude);
// });

    // var coords = window.Geolocation.currentLocation().coords;

  };
