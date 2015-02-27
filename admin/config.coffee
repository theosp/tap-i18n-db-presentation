SlidesSchema =
  content:
    type: String
    autoform:
      rows: 5
  order:
    type: Number

Slides = new Mongo.Collection "slides"

Slides.attachSchema SlidesSchema

@Slides = Slides

@AdminConfig =
  collections:
    Slides:
      fields: ["_id", "order", "content"]
      tableColumns: [
        {label: 'Content', name: 'content'}
      ]
      children: []
