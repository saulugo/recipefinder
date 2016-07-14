ENV["FOOD2FORK_KEY"] = '44929cbfa8423c8b9527bf45794bdb7f'

class Recipe
  include HTTParty
  
  key_value = ENV['FOOD2FORK_KEY']
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  base_uri "http://#{hostport}/api"
  default_params key: key_value
  format :json

  def self.for term
    get('/search', query: { q: term })['recipes']
  end

end