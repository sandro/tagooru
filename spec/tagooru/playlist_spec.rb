require File.expand_path(File.dirname(__FILE__) + '../../spec_helper')

describe Tagooru::Playlist do
  it "requires contents when instantiated" do
    lambda {
      Tagooru::Playlist.new('hi')
    }.should_not raise_error
  end

  describe "parsing" do
    before do
      @playlist = Tagooru::Playlist.new fixture("fix.m3u")
    end

    it "scans playlist lines" do
      @playlist.should_receive(:lines).and_return([])
      @playlist.parse
    end

    it "includes track names and track locations" do
      track = @playlist.parse.first
      track.name.should == "Necro - You Did It"
      track.location.should == 'http://files.raplife.ru/jka/xxx/17--you_did_it-ftd.mp3'
    end

    it "understands track names with commas in them" do
      track = @playlist.parse.last
      track.name.should == "Jesus - I Fix my Eyes, on, You"
    end

    describe "#lines" do
      before do
        @array = @playlist.contents.to_a
        @playlist.contents.stub!(:to_a => @array)
      end

      it "skips the first line" do
        @array.should_receive(:shift).and_return([])
        @playlist.send(:lines)
      end

      it "removes line separators" do
        @playlist.send(:lines).first.should_not =~ /(\r|\n)$/
      end
    end
  end
end
