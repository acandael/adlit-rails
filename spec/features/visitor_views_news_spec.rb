require 'rails_helper'

describe "viewing the list of news items" do
  it "shows the news items" do
    newsarticle1 = NewsArticle.create(title: "De mazen van het internet",
                                     body: "Hoe veilig gedragen we ons op het web? En zijn we ons bewust van de risico’s die we lopen?")

    newsarticle2 = NewsArticle.create(title: "Ello, social netwerken zonder reclame",
                                     body: "Er heerst heel wat buzz op het Internet.. There is a new player in social media!")
    newsarticle3 = NewsArticle.create(title: "Product placement heruitgevonden?",
                                     body: "De muziekgigant Universal Music Group heeft bekend gemaakt dat ze voortaan, met behulp van technologie van het Britse bedrijf Mirriad, nieuwe reclame in reeds bestaande videoclips kan smokkelen")

    visit news_path

    expect(page).to have_text(newsarticle1.title)
    expect(page).to have_text(newsarticle2.title)
    expect(page).to have_text(newsarticle3.title)

    expect(page).to have_text(newsarticle2.body[0..150])
    expect(page).to have_text(newsarticle2.created_at.strftime('%d %B %Y'))
    expect(page).to have_selector("img[src$='#{newsarticle2.image}']")
  end
end

