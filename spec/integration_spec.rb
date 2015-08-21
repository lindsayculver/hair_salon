require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new stylist', {:type => :feature}) do
  it('allows a user to click a stylist to see the clients') do
    visit('/')
    click_link('add new stylist')
    fill_in('name', :with =>'Debbie Hairy')
    click_button('Add Stylist')
    expect(page).to have_content('Success!')
  end
end


describe('viewing all the stylists', {:type => :feature}) do
  it('allows a user to see all of the stylists that have been created') do
    stylist = Stylist.new({:name => 'Debbie Hairy', :id => nil})
    stylist.save()
    visit('/')
    click_link('stylists')
    expect(page).to have_content(stylist.name)
  end
end

describe('seeing details for a single stylist', {:type => :feature}) do
  it('allows a user to click a stylist to see the clients') do
    test_stylist = Stylist.new({:name => 'Debbie Hairy', :id => nil})
    test_stylist.save()
    test_client = Client.new({:name => 'Hairy Potter', :list_id => test_stylist.id()})
    test_client.save()
    visit('/stylists')
    click_link(test_stylist.name())
    expect(page).to have_content(test_client.name())
  end
end

describe('adding clients to a stylist', {:type => :feature}) do
  it('allows a user to add a client to a stylist') do
    test_stylist = Stylist.new({:name => 'Debbie Hairy', :id => nil})
    test_stylist.save()
    visit("/stylists/#{test_stylist.id()}")
    fill_in("name", {:with => "Hairy Potter"})
    click_button("Add client")
    expect(page).to have_content("Success")
  end
end
