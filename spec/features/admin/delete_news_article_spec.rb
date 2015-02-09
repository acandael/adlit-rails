require 'rails_helper'

describe "Deleting a news article" do
  before do
    user = User.create!(user_attributes)
    sign_in(user)
  end

  it "destroys the news article and shows the news articles listing without the deleted news article" do

    newsarticle = NewsArticle.create!(newsarticle_attributes) 

    visit admin_news_articles_path

    click_link 'Delete'

    expect(current_path).to eq(admin_news_articles_path)

    expect(page).not_to have_text(newsarticle.title)

    expect(page).to have_text("News article successfully deleted!")
  end
end

