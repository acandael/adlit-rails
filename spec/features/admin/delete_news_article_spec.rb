require 'rails_helper'

describe "Deleting a news article" do

  let(:user) { User.create!(user_attributes) }
  let!(:newsarticle) { NewsArticle.create!(newsarticle_attributes) }

  before do
    sign_in(user)
    visit admin_news_articles_path
    click_link 'Delete'
  end

  it "destroys the news article and shows the news articles listing without the deleted news article" do

    expect(current_path).to eq(admin_news_articles_path)

    expect(page).not_to have_text(newsarticle.title)

    expect(page).to have_text("News article successfully deleted!")
  end
end

