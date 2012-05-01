require 'mechanize-wysi'
require 'mechanize-wysi/frame_agent_collection'

module Mechanize::Wysi
  def initialize
    original_initialize
    @agents = Mechanize::Wysi::FrameAgentCollection.new
  end

  def get_frames
    agents = []
    self.page.frames.each do |frame|
      agent = self.class.new
      agent.get(frame.content.uri, self.page.uri, {})
      agents << agent
    end
    @agents << agents
  end

  def get(uri, parameters = [], referer = nil, headers = {})
    ret = original_get(uri, parameters, referer, headers)
    return ret
  end

  def agents
    @agents.current
  end
end

