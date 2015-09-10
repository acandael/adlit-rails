require 'rails_helper'

describe "viewing the list of news items" do
  let(:newscategory1) { NewsCategory.create(name: "aanbevolen") }
  let(:newscategory2) { NewsCategory.create(name: "project") }
  let!(:newsarticle1) { NewsArticle.create(title: "title 1", news_category: newscategory1, body: "this is the body") }
  let!(:newsarticle2) { NewsArticle.create(title: "title 2", news_category: newscategory2, body: "this is the body") }

  it "shows the news items" do
    visit news_path

    expect(page).to have_text(newsarticle1.title)
    expect(page).to have_text(newsarticle2.title)
    expect(page).to have_text(newscategory1.name)
    expect(page).to have_text(newscategory2.name)

    expect(page).to have_text(newsarticle2.body[0..150])
    expect(page).to have_text(newsarticle2.created_at.strftime('%d %B %Y'))
    expect(page).to have_selector("img[src$='#{newsarticle2.image}']")
  end

  it "filters by newscategory" do
    visit news_path

    click_link newsarticle1.news_category.name

    expect(page).to have_text(newsarticle1.title)
    expect(page).not_to have_text(newsarticle2.title)
  end
end

