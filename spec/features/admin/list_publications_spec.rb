require 'rails_helper'

describe "viewing the list of publications" do
  it "shows the publications" do
    category_1 = Category.new(name: "deliverables")
    category_2 = Category.new(name: "wetenschappelijke output")
    category_3 = Category.new(name: "presentaties")

    publication1 = Publication.create!(title: "Deliverable 1.1 Rapport rond mediabezit en -gebruik van minderjarigen",
                                       category: category_1)
    publication2 = Publication.create!(title: "Het mediabezit en -gebruik bij minderjarigen anno 2014",
                                       category: category_2)
    publication3 = Publication.create!(title: "Het mediabezit en -gebruik bij minderjarigen anno 2014: de rol van de socio-economische status",
                                       category: category_3)

    visit admin_publications_path

    expect(page).to have_text(publication1.title)
    expect(page).to have_text(publication2.title)
    expect(page).to have_text(publication3.title)
  end
end

