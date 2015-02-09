require 'rails_helper'

describe "Editing a movie" do

  before do
    user = User.create!(user_attributes)
    sign_in(user)
  end

  it "updates the news article" do
    newsarticle = NewsArticle.create!(newsarticle_attributes) 

    visit admin_news_articles_path

    click_link 'Edit'

    expect(current_path).to eq(edit_admin_news_article_path(newsarticle))

    expect(find_field('Title').value).to eq(newsarticle.title)

    fill_in 'Title', with: 'Updated News Article Title'

    click_button 'Update News Article'

    expect(current_path).to eq(admin_news_articles_path)
    expect(page).to have_text('Updated News Article Title')
    expect(page).to have_text('News article successfully updated!')
  end

  it "does not update the news article if it's invalid" do
    newsarticle = NewsArticle.create!(newsarticle_attributes) 

    visit edit_admin_news_article_path(newsarticle)

    fill_in 'Title', with: ""

    click_button 'Update News Article'

    expect(page).to have_text('error')
  end
end

