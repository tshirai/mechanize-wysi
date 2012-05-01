require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Mechanize::Wysi do
  let(:agent) { Mechanize::TestAgent.new }

  describe "as a module" do
    it "should have an additional local value." do
      str = "hello"
      agent.var.should be_nil
      agent.var = str
      agent.var.should == str
    end
    it "should be included in TestAgent." do
      agent.class.included_modules.should include(Mechanize::Wysi)
      agent.class.included_modules.should include(Mechanize::WysiTest)
    end
  end

  context "with a frame html" do
    before :each do
      agent.get(frame_uri)
    end
    describe "#frames" do
      it "should return all frames." do
        agent.page.frames.map{|frame| frame.content.uri.to_s}.sort.should == frames.map{|fname| file_uri(fname).to_s}.sort
      end
    end
    describe "#agents" do
      it "should return all frame agents."
      # it "should return all frame agents." do
      #   agent.agents.map{|agent| agent.page.uri.to_s}.sort.should == frames.map{|fname| file_uri(fname).to_s}.sort
      # end
    end
  end

end


# for confirmation of the specification of Mechanize.
describe Mechanize do
  let(:agent) { Mechanize.new }

  describe "#dup" do
    it "should not copy html agent." do
      agent.get(frame_uri)
      agent.page.uri.to_s.should == frame_uri.to_s
      agent_dup = agent.dup
      agent.get(no_frame_uri)
      agent.page.uri.to_s.should == file_uri("no_frame1.html").to_s
    end
  end

  describe "#request_headers" do
    context "with no setting" do
      it "should return {}." do
        agent.request_headers.should == {}
        agent.get(frame_uri)
        agent.request_headers.should == {}
      end
    end
  end
end

