SlidesSchema =
  content:
    type: String
    autoform:
      rows: 5
  "i18n.zh-HK.content":
    type: String
    label: 'Chinese Content',
    optional: true
  "i18n.fr.content":
    type: String
    label: 'French Content',
    optional: true
  order:
    type: Number

Slides = new TAPi18n.Collection "slides"

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
