require 'mechanize'
require 'mechanize-wysi/frame_agent_collection'
require 'mechanize-wysi/mechanize-wysi'

class Mechanize
  alias :original_get :get
  alias :original_initialize :initialize
end


