require 'mechanize-wysi'

module Mechanize::Wysi
  class FrameAgentCollectionIndexError < StandardError
  end

  class FrameAgentCollection
    def initialize
      @agents = [[]]
      @index = 0
    end

    def back
      @index -= 1
      if @index < 0
        raise FrameAgentCollectionIndexError
      end
      current
    end

    def forward
      @index += 1
      if @index >= self.agents.size
        raise FrameAgentCollectionIndexError
      end
      current
    end

    def <<(agents)
      @agents = @agents[0..self.index]
      @agents << agents
      @index += 1
    end

    def current
      return self.agents[self.index]
    end

    private
    def agents
      return @agents
    end
    def index
      return @index
    end
  end
end


