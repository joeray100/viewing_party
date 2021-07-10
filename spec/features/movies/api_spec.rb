require 'rails_helper'

RSpec.describe 'test movie search' do
  before :each do
    user = User.create(user_name: 'tester', email: 'test@test.com', password: 'password1')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
  it 'search results', :vcr do
    visit discover_path

    fill_in :search, with: 'Dark'
    click_button 'Find Movies'

    expect(current_path).to eq(movies_path)
    expect(page.status_code).to eq(200)
    within('.search_results') do
      expect(page.all('ul', count: 40))
    end
    expect(page).to have_link('Dark Phoenix')
    expect(page).to have_content('Vote Average: 6.1')
    expect(page).to have_button('Find Top Rated Movies')
  end
end
