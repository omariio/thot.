Meteor.methods
	deleteAccount: (userId) ->
		if @userId == userId
			Meteor.users.remove _id: @userId

	onSuccess = (imageData) ->
	  Photos.insert
	    image: imageData
	    createdAt: new Date
  	return
