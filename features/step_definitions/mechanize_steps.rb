Given /^I don't get any page\.$/ do
  @agent = Mechanize::TestAgent.new
end

When /^I get a non\-frame page\.$/ do
  @agent.get(no_frame_uri)
end

Then /^I should return tags in the non-frame page\.$/ do
  @agent.page.links.map{|link| link.href.to_s}.sort.should == no_frame1_links.sort
end

Given /^I have a visited non-frame page\.$/ do
  @agent = Mechanize.new
  @agent.get(no_frame_uri)
end

When /^I click a link and get a non\-frame page\.$/ do
  @agent.page.link_with(:href => "no_frame2.html").click
end

Then /^I should return tags in the next non-frame page\.$/ do
  @agent.page.links.map{|link| link.href.to_s}.sort.should == no_frame2_links.sort
end

