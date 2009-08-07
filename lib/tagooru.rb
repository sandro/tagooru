require 'rubygems'
require 'httparty'

$LOAD_PATH.unshift(File.dirname(__FILE__))

class Tagooru
  autoload :Playlist, 'tagooru/playlist'
  autoload :Track, 'tagooru/track'

  include HTTParty
  base_uri 'http://tagoo.ru'
  default_params :for => :audio

  def self.search(query, page = 1)
    playlist = get '/en/search_playlist.php', :query => {:search => query, :page => page}
    Playlist.new(playlist).parse
  end

  def self.first(query, page = 1)
    search(query, page).detect {|t| t.accessible?}
  end
end
