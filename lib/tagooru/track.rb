class Tagooru
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
