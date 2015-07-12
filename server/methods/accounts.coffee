Meteor.methods
	deleteAccount: (userId) ->
		if @userId == userId
			Meteor.users.remove _id: @userId

	onSuccess: (imageData) ->
	  coords = Geolocation.currentLocation().coords
	  Photos.insert
	    image: imageData
	    createdAt: new Date
	    likes: 0
	    marker:
	      lat: coords.latitude
	      lng: coords.longitude
	      infoWindowContent: '<img width=\'100\' src=\'' + imageData + '\' />'
  	return
