require "spec_helper"

RSpec.describe "home#index", type: :system do
  scenario "表示" do
    visit "/home"
    expect(page).to have_content "Home#index"
  end
end
