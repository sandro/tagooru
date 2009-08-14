require File.expand_path(File.dirname(__FILE__) + '../../spec_helper')

describe Tagooru::Track do
  before do
    @track = Tagooru::Track.new "Fix You", "http://google.com/?q=fixyou.mp3"
  end

  it "has a name and location" do
    @track.name.should == "Fix You"
    @track.location.should == "http://google.com/?q=fixyou.mp3"
  end

  describe "accessibility" do
    it "is accessible" do
      http = stub(:request_head => stub(:code => 200), :null_object => true)
      Net::HTTP.stub!(:new => http)
      @track.should be_accessible
    end

    context "not accessible" do
      before do
        @http = stub(:null_object => true)
        Net::HTTP.stub!(:new => @http)
      end

      it "rescues SocketError" do
        @http.should_receive(:request_head).and_raise(SocketError)
        @track.should_not be_accessible
      end

      it "rescues Timeout::Error" do
        timeout_error = Timeout::Error.new 'timeout'
        @http.should_receive(:request_head).and_raise(timeout_error)
        @track.should_not be_accessible
      end
    end
  end
end
