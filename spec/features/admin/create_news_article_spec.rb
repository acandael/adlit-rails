require 'rails_helper'

describe "Creating a newsarticle" do
  it "saves the newsarticle and shows the newsarticle details" do
    visit admin_news_articles_path

    click_button 'Add News Article'

    expect(current_path).to eq(new_admin_news_article_path)

    fill_in "Title", with: "New news article title"
    fill_in "Body", with: "Hoe veilig gedragen we ons op het web? En zijn we ons bewust van de risico’s die we lopen?"
    fill_in "Link", with: "http://www.cepec.ugent.be"

    click_button 'Add News Article'

    expect(current_path).to eq(admin_news_articles_path)
    expect(page).to have_text('The news article was successfully added')
    expect(page).to have_text('New news article title')

    newsarticle = NewsArticle.last
    
    click_link newsarticle.title

    expect(page).to have_text('New news article title')
    expect(page).to have_text('Hoe veilig gedragen we ons op het web? En zijn we ons bewust van de risico’s die we lopen?')
    expect(page).to have_text('http://www.cepec.ugent.be')
  end

  it "doesn't save the news article when the data is invalid" do
    visit admin_news_articles_path

    click_button 'Add News Article'

    expect(current_path).to eq(new_admin_news_article_path)

    fill_in "Title", with: ""
    fill_in "Body", with: "Hoe veilig gedragen we ons op het web? En zijn we ons bewust van de risico’s die we lopen?"
    fill_in "Link", with: "http://www.cepec.ugent.be"

    click_button 'Add News Article'
    expect(page).to have_text('Oops! The newsarticle could not be saved.')
  end
end

