When /^I get a frame page\.$/ do
  @agent.get(frame_uri)
end

Then /^I should return tags in the frame page\.$/ do
  @agent.page.links.map{|link| link.href.to_s}.sort.should == frame_links.sort
end

Given /^I have a visited frame page\.$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I click a link and get a frame page\.$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should also return tags in the next frame page\.$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I get a iframe page\.$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should return tags in the iframe page\.$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I have a visited iframe page\.$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I click a link and get a iframe page\.$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should also return tags in the next iframe page\.$/ do
  pending # express the regexp above with the code you wish you had
end
