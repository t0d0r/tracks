When /^I wait a second$/ do
  sleep(1)
end


Then /the badge should show (.*)/ do |number|
  # puts response.body.inspect
  badge = -1
  xpath= "//span[@id='badge_count']"

  if response.respond_to? :selenium
    response.should have_xpath(xpath) 
    badge = response.selenium.get_text("xpath=#{xpath}").to_i
  else
    response.should have_xpath(xpath) do |node|
      badge = node.first.content.to_i
    end
  end

  badge.should == number.to_i
end
