require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe "create a word path", {:type => :feature} do

  before :each do
    visit "/"
  end

  scenario "creates a word, edits it, and then deletes it." do
    click_on "Add a new Word!"
    fill_in "spelling", :with => "Test"
    click_on "Go!"
    expect(page).to have_content "Test"
    click_on "Test"
    click_on "Edit word"
    fill_in "spelling", :with => "Word"
    click_on "Update"
    expect(page).to have_content "Word"
    click_on "Word"
    click_on "Edit word"
    click_on "Delete word"
    expect(page).to have_no_content
  end

  scenario "creates a word, gives it a definition, edits the definition, and deletes the definition." do
    click_on "Add a new Word!"
    fill_in "spelling", :with => "Test"
    click_on "Go!"
    click_on "Test"
    fill_in "definition", :with => "To Experiment"
    click_on "Add definition"
    expect(page).to have_content "To Experiment"
    click_on "To Experiment"
    fill_in "text", :with => "A Word"
    click_on "Update definition"
    expect(page).to have_content "A Word"
    click_on "A Word"
    click_on "Delete definition"
    expect(page).to have_no_content
  end
end