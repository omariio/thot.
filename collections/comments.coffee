# @Comments = new Meteor.Collection('comments');

Comments.helpers
  docTitle: ->
    Posts.findOne(@doc)?.title
  author: ->
    user = Meteor.users.findOne(@owner)
    if user?.profile?.firstName? and user?.profile?.lastName
      user.profile.firstName + ' ' + user.profile.lastName
    else
      user?.emails?[0].address

# Schemas.Comments = new SimpleSchema(
# 	# createdAt:
# 	# 	type: Date
# 		# autoValue: ->
# 		# 	if this.isInsert
# 		# 		new Date()
#
#   content:
# 		type: String
# 		autoform:
# 			rows: 5
# )
#
# Comments.attachSchema(Schemas.Comments)
