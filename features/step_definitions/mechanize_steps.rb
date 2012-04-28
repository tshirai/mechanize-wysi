def links1
  ["no_frame2.html", "http://example.com/not_found.html"]
end

def links2
  ["no_frame1.html", "http://example.com/not_found.html"]
end

def no_frame_uri
  file_uri("no_frame1.html")
end

def file_uri(fname)
  uri = URI.parse("file://#{File.expand_path("../../spec/files/#{fname}", File.dirname(__FILE__))}")
end

Given /^I don't get any page\.$/ do
  @agent = Mechanize.new
end

When /^I get a non\-frame page\.$/ do
  @agent.get(no_frame_uri)
end

Then /^I should return tags in the page\.$/ do
  @agent.page.links.map{|link| link.href.to_s}.sort.should == links1.sort
end

Given /^I have a visited page\.$/ do
  @agent = Mechanize.new
  @agent.get(no_frame_uri)
end

When /^I click a link and get a non\-frame page\.$/ do
  @agent.page.link_with(:href => "no_frame2.html").click
end

Then /^I should also return tags in the page\.$/ do
  @agent.page.links.map{|link| link.href.to_s}.sort.should == links2.sort
end
