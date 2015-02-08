# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

NewsArticle.create!([
  {
    title: 'De mazen van het internet',
    body: 
    %{
      Hoe veilig gedragen we ons op het web? En zijn we ons bewust van de risico’s       die we lopen?
    }.squish,
    link: 'http://www.cepec.ugent.be'
  },
  {
    title: 'Ello, social netwerken zonder reclame',
    body:
    %{
      Er heerst heel wat buzz op het Internet.. There is a new player in social med      ia!
    }.squish,
    link: 'http://www.cjs.ugent.be'
  },
  {
    title: 'Product placement heruitgevonden?',
    body:
    %{
      De muziekgigant Universal Music Group heeft bekend gemaakt dat ze voortaan, m      et behulp van technologie van het Britse bedrijf Mirriad, nieuwe reclame in r      eeds bestaande videoclips kan smokkelen
    }.squish,
    link: 'http://www.cjs.ugent.be'
  }
])

