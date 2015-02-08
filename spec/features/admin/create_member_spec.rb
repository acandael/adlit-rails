require 'rails_helper'

describe "Creating a new member" do
  it "saves the member and shows the new member details" do
    visit admin_members_path

    click_button 'Add New Member'

    expect(current_path).to eq(new_admin_member_path)

    fill_in "Name", with: "Katarina Panic"
    fill_in "Function", with: "Promotor"
    fill_in "Email", with: "katarina.panic@ugent.be"
    fill_in "Phone", with: "09 264 91 89"
    fill_in "Organization", with: "Universiteit Gent"
    fill_in "Address", with: "vakgroep Communicatiewetenschappen Korte Meer 11"
    fill_in "Affiliation", with: "Center for Journalism Studies"
    fill_in "Link", with: "http://www.cepec.ugent.be"

    
    click_button 'Create Member'

    expect(current_path).to eq(admin_members_path)
    expect(page).to have_text('Katarina Panic')
    expect(page).to have_text('The member was successfully added')
    
    click_link 'Katarina Panic'

    expect(page).to have_text('Katarina Panic')
    expect(page).to have_text('Promotor')
    expect(page).to have_text('katarina.panic@ugent.be')
    expect(page).to have_text('09 264 91 89')
    expect(page).to have_text('Universiteit Gent')
    expect(page).to have_text('vakgroep Communicatiewetenschappen Korte Meer 11')
    expect(page).to have_text('Center for Journalism Studies')
  end

  it "does not save the member if it's invalid" do
    visit admin_members_path

    click_button 'Add New Member'

    expect {
      click_button 'Create Member'
    }.not_to change(Member, :count)

    expect(page).to have_text('error')
  end
end

