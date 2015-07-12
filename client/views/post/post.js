Template.addPost.events ({
  'click #picture': function(){
    MeteorCamera.getPicture(function(error, data){
      if (! error) {
        onSuccess(data);
      }
    });
  }
});

var onSuccess = function(imageData){
  Photos.insert({
    image: imageData,
    createdAt: new Date,
    likes: 0
  });
};
