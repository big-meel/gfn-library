require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
   test "visiting the index" do
     visit root_url
  
     assert_selector "h1", text: "Geforce Now Library"
   end
end
