def member_attributes(overrides = {})
  {
    name: "Liselot Hudders",
    function: "promotor",
    image: "liselot-hudders.jpg",
    email: "liselot.hudders@ugent.be",
    phone: "09 264 91 89",
    organisation: "Universiteit Gent",
    address: "Vakgroep Communicatiewetenschappen Korte Meer 11,                                     9000 Gent",
    affiliation: "Center for Persuasive Communication",
    link: "http://www.cepec.ugent.be"
  }.merge(overrides)
end

def stakeholder_attributes(overrides = {})
  {
    name: "FOD Economie",
    field_id: 1,
    link: "http://www.fod_economie.be"
  }.merge(overrides)
end

def newsarticle_attributes(overrides = {})
  {
    title: "De mazen van het internet",
    body: "Hoe veilig gedragen we ons op het web? En zijn we ons bewust van de risico’s die we lopen?",
    image: "someimage.jpg",
    link: "http://www.somewebsite.com"
  }.merge(overrides)
end

def user_attributes(overrides = {})
  {
    name: "Example User",
    email: "user@example.com",
    password: "secret",
    password_confirmation: "secret"
  }.merge(overrides)
end


