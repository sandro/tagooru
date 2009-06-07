class Tagooru
  class Playlist
    require 'enumerator'

    attr_reader :contents

    def initialize(contents)
      @contents = contents
    end

    def parse
      tracks = []
      lines.each_slice(2) do |track_info|
        name = track_info[0].split(",", 2).last
        tracks << Track.new(name, track_info[1])
      end
      tracks
    end

    private

    def lines
      @lines ||= begin
        list = contents.to_a
        list.shift
        list.map {|line| line.chomp}
      end
    end

    class Track < Struct.new(:name, :location)
      def accessible?
        url = URI.parse(location)
        http = Net::HTTP.new url.host
        http.open_timeout = 2
        http.read_timeout = 2
        begin
          (200..399).include? http.request_head(url.path).code.to_i
        rescue SocketError
          false
        end
      end
    end
  end
end
