Router.route '/', ->
  @wait Meteor.subscribe 'slides', this.params._id, ->
    setTimeout ->
      Reveal.initialize()
    , 200

  if @ready()
    @render 'slides'
  else
    @render 'loading'

Router.route '/login', ->
  @render 'login'

Router.route '/reset', ->
  self = @
  Meteor.call 'reset', ->
    self.redirect('/')

if Meteor.isClient
  Template.slides.helpers
    slides: ->
      Slides.find({}, {sort: {order: 1}}).fetch()

if Meteor.isServer
  reset_slides = ->
    Slides.remove {}

    i = 0
    for slide in @slides_contents
      Slides.insert
        order: i++
        content: slide

  Meteor.startup ->
    # init
    #if Slides.find({}).count() == 0
    #  reset_slides()
    reset_slides()

  Meteor.methods
    reset: -> reset_slides()

  Meteor.publish 'slides', -> Slides.find({})
