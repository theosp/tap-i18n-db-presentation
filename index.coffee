Router.route '/', ->
  @wait Meteor.subscribe 'slides', this.params._id

  @render 'slides'

Router.route '/login', ->
  @render 'login'

if Meteor.isClient
  Template.slides.helpers
    slides: ->
      Slides.find({}, {sort: {order: 1}}).fetch()

  Template.slides.rendered = ->
    Reveal.initialize()

if Meteor.isServer
  Meteor.publish 'slides', -> Slides.find({})
