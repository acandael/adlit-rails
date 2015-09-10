require 'rails_helper'

describe "viewing the list of publications" do
  let(:category_1) { Category.new(name: "deliverables")}
  let(:category_2) {Category.new(name: "wetenschappelijke output")}
  let(:category_3) {Category.new(name: "presentaties")}
  let!(:publication1) {Publication.create!(title: "Deliverable 1.1 Rapport rond mediabezit en -gebruik van minderjarigen", category: category_1, document: "document1.doc")}
  let!(:publication2) {Publication.create!(title: "Het mediabezit en -gebruik bij minderjarigen anno 2014", category: category_2, document: "document2.doc")}
  let!(:publication3) {Publication.create!(title: "Het mediabezit en -gebruik bij minderjarigen anno 2014: de rol van de socio-economische status", category: category_3, document: "document3.doc")}

  it "shows the publications" do


    visit output_path

    expect(page).to have_text(publication1.title)
    expect(page).to have_text(publication2.title)
    expect(page).to have_text(publication3.title)
    expect(page).to have_link(publication1.document)
  end

  it "shows the publications sorted by category" do
    visit publications_path("deliverables")
    expect(page).to have_text(publication1.title)
    expect(page).not_to have_text(publication2.title)
    expect(page).not_to have_text(publication3.title)
  end
end

