@Config =
	name: 'higherThot'
	title: ->
			TAPi18n.__ 'configTitle'
	subtitle: ->
			TAPi18n.__ 'configSubtitle'
	logo: ->
		'<b>' + @name + '</b>'
	footer: ->
		@name + ' - Copyright ' + new Date().getFullYear()
	emails:
		from: 'noreply@' + Meteor.absoluteUrl()
	blog: 'http://benjaminpeterjones.com'
	about: 'http://benjaminpeterjones.com'
	username: false
	homeRoute: '/dashboard'
	socialMedia:
		[
			['http://facebook.com/benjaminpeterjones','facebook']
			['http://twitter.com/BenPeterJones','twitter']
			['http://github.com/yogiben','github']
		]

Avatar.options =
	customImageProperty: 'profile.picture'

Meteor.startup ->
	if Meteor.isClient
		$.getJSON 'http://api.wunderground.com/api/66cc45223c7fe53f/conditions/q/CA/San_Francisco.json', (data) ->
			window.weatherData = data.current_observation
			TAPi18n.setLanguage('en')
<<<<<<< HEAD
		return
=======
>>>>>>> 785bb1e921a4b0e094ab146fdd43f2303a935ccd
