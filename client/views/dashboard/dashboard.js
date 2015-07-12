Template.dashboard.helpers({
  getComments: function(_id){
    return Comments.find({target:_id});
  }
})
