require 'rails_helper'

feature 'Admin interacts with news' do

  before do
    user = User.create!(user_attributes)
    sign_in(user)
  end

  scenario 'and sees news items' do
    newsarticle1 = NewsArticle.create(title: "De mazen van het internet",
                                     body: "Hoe veilig gedragen we ons op het web? En zijn we ons bewust van de risico’s die we lopen?")

    newsarticle2 = NewsArticle.create(title: "Ello, social netwerken zonder reclame",
                                     body: "Er heerst heel wat buzz op het Internet.. There is a new player in social media!")

    visit admin_news_articles_path

    expect(page).to have_text(newsarticle1.title)
    expect(page).to have_text(newsarticle2.title)
  end

  scenario 'admin clicks news-article link and sees details' do
    newsarticle = NewsArticle.create!(newsarticle_attributes)

    visit admin_news_articles_path

    click_link newsarticle.title

    expect(page).to have_text newsarticle.title
    expect(page).to have_text newsarticle.body
    expect(page).to have_text newsarticle.link
  end

end

