require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

class Mechanize::Wysi::FrameAgentCollection
  public :agents, :index
end

module Mechanize::Wysi
  describe FrameAgentCollection do
    let(:collection) { FrameAgentCollection.new }
    let(:data) { [1,2,3] }
    let(:data2) { [3,4,5] }
    let(:data3) { [5,6,7] }

    context "initialize" do
      describe "#current" do
        it "should return []" do
          collection.current.should == []
        end
      end
      describe "#<<(data)" do
        it "should insert data" do
          collection << data
          collection.current.should == data
        end
      end
      describe "#back" do
        it "should raise FrameAgentCollectionIndexError" do
          expect {
            collection.back
          }.to raise_error{
            FrameAgentCollectionIndexError
          }
        end
      end
      describe "#forward" do
        it "should raise FrameAgentCollectionIndexError" do
          expect {
            collection.forward
          }.to raise_error{
            FrameAgentCollectionIndexError
          }
        end
      end
    end

    context "1 item added" do
      before :each do
        collection << data
      end

      describe "#current" do
        it "should return last data" do
          collection.current.should == data
          collection.index.should == 1
        end
      end
      describe "#<<(data)" do
        before :each do
          collection << data2
        end

        it "should insert data" do
          collection.current.should == data2
        end
        it "should have 3 data." do
          collection.index.should == 2
          collection.agents.should == [[], data, data2]
        end
      end
      describe "#back" do
        before :each do
          @ret = collection.back
        end
        it "should return previous data." do
          @ret.should == []
          collection.current.should == []
        end
        it "should have last data." do
          collection.index.should == 0
          collection.agents.should == [[], data]
        end
      end
      describe "#forward" do
        it "should raise FrameAgentCollectionIndexError" do
          expect {
            collection.forward
          }.to raise_error{
            FrameAgentCollectionIndexError
          }
        end
      end

    end
    context "2 item added and went back" do
      before :each do
        collection << data
        collection << data2
        @ret = collection.back
      end

      describe "#current" do
        it "should return last data" do
          @ret.should == data
          collection.current.should == data
          collection.index.should == 1
          collection.agents.should == [[], data, data2]
        end
      end
      describe "#<<(data)" do
        before :each do
          collection << data3
        end

        it "should insert data" do
          collection.current.should == data3
        end
        it "should have 3 data." do
          collection.index.should == 2
          collection.agents.should == [[], data, data3]
        end
      end
      describe "#back" do
        before :each do
          @ret = collection.back
        end
        it "should return previous data." do
          @ret.should == []
          collection.current.should == []
        end
        it "should have last data." do
          collection.index.should == 0
          collection.agents.should == [[], data, data2]
        end
      end
      describe "#forward" do
        before :each do
          @ret = collection.forward
        end
        it "should return last data" do
          @ret.should == data2
          collection.current.should == data2
        end
        it "should have 2 data." do
          collection.index.should == 2
          collection.agents.should == [[], data, data2]
        end
      end
    end
  end
end
