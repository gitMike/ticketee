
require 'spec_helper'

feature 'Creating Projects' do
  scenario "can create a project" do
    visit '/'

    click_link 'New Project'

    fill_in 'Name', :with => 'TextMate'
    fill_in 'Description', :with => 'A text-editor for OS X'
    click_button 'Create Project'

    expect(page).to have_content('Project has been created')
    
    project = Project.where(name: "TextMate").first
    
    expect(page.current_url).to eql(project_url(project))
    
    title = "TextMate - Projects - Ticketee"
    expect(find("title").native.text).to have_content(title)
  end
end    
