require 'rubygems'
require 'httparty'

$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'httparty_ext.rb'

class Tagooru
  autoload :Playlist, 'tagooru/playlist'
  autoload :Track, 'tagooru/track'

  include HTTParty
  base_uri 'http://tagoo.ru'
  default_params :for => :audio, :key => '74d8940f'
  headers 'Referer' => 'http://tagoo.ru/en/webmaster.php?mode=json_api'
  format :plain

  # override method from HTTParty to prevent cookies from overriding other
  # header data (httparty 0.4.4)
  def self.perform_request(http_method, path, options) #:nodoc:
    Request.new(http_method, path, default_options.dup.merge(options)).perform
  end

  def self.search(query, page = 1)
    response = get '/api_search.php', :query => {:search => query, :page => page, :seed => generate_seed}
    data = Crack::JSON.parse(response.sub(/^.+= /, ''))
    data['data'].map do |d|
      Track.new d['title'], d['file_url']
    end
  end

  # seed argument taken from search api
  # http://tagoo.ru/script/api/search.js
  def self.generate_seed
    (rand * 100_000).to_i
  end

  def self.first(query, page = 1)
    search(query, page).detect {|t| t.accessible?}
  end
end
