module Mechanize::WysiTest
  def var=(value)
    @hoge = value
  end
  def var
    return @hoge
  end
end

class Mechanize::TestAgent < Mechanize
  include Mechanize::Wysi
  include Mechanize::WysiTest
end

def no_frame1_links
  ["no_frame2.html", "http://example.com/not_found.html"]
end

def no_frame2_links
  ["no_frame1.html", "http://example.com/not_found.html"]
end

def no_frame_uri
  file_uri("no_frame1.html")
end

def file_uri(fname)
  uri = URI.parse("file://#{File.expand_path("../../spec/htdocs/#{fname}", File.dirname(__FILE__))}")
end

def frame_uri
  file_uri("2frames.html")
end

def frames
  ["no_frame1.html", "no_frame2.html"]
end

def frame_links
  no_frame1_links + no_frame2_links
end

