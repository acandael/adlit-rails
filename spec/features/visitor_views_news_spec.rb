require 'rails_helper'

describe "viewing the list of news items" do

  let!(:newsarticle1) { NewsArticle.create(title: "title 1", body: "this is the body") }
  let!(:newsarticle2) { NewsArticle.create(title: "title 2", body: "this is the body") }
  let!(:newsarticle3) { NewsArticle.create(title: "title 3", body: "this is the body") }

  it "shows the news items" do
    visit news_path

    expect(page).to have_text(newsarticle1.title)
    expect(page).to have_text(newsarticle2.title)
    expect(page).to have_text(newsarticle3.title)

    expect(page).to have_text(newsarticle2.body[0..150])
    expect(page).to have_text(newsarticle2.created_at.strftime('%d %B %Y'))
    expect(page).to have_selector("img[src$='#{newsarticle2.image}']")
  end
end

