Router.map ->
  @route "home",
    path: "/"
    layoutTemplate: "homeLayout"
  @route "addPost",
    path: "/addPost"
    layoutTemplate: "addPost"  

  @route "dashboard",
    path: "/dashboard"
    waitOn: ->
      [
        subs.subscribe 'posts'
        subs.subscribe 'comments'
        subs.subscribe 'attachments'
      ]
    data: ->
      posts: Posts.find({},{sort: {createdAt: -1}}).fetch()
