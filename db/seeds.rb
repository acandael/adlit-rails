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

Member.create!([
  {
    name: 'Liselot Hudders',
    email: 'liselot.hudders@ugent.be',
    phone: '09 264 91 89',
    organization: 'Universiteit Gent',
    address: %{Vakgroep Communicatiewetenschappen Korte Meer 11,                                     9000 Gent}.squish,
    affiliation: 'Center for Persuasive Communication',
    link: 'http://www.cepec.ugent.be'
  },
  {
    name: 'Katarina Panic',
    email: 'katarina.panic@ugent.be',
    phone: '32 9 264 67 98',
    organization: 'Universiteit Antwerpen',
    address: %{Department of Media Studies, 9000 Gent}.squish,
    affiliation: 'Center for Journalism Studies',
    link: 'http://www.cjs.ugent.be'
  },
  {
    name: 'Pieter De Pauw Panic',
    email: 'pieter.depauw@ugent.be',
    phone: '32 9 264 34 56',
    organization: 'Katholieke Universiteit Leuven',
    address: %{Departement of Marketing, 3000 Leuven}.squish,
    affiliation: 'Center for Marketing Studies',
    link: 'http://www.cjs.ugent.be'
  }
])

