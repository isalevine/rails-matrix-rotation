require_relative './config/environment.rb'

def get_json(url)
    response = RestClient.get(url)
    json = JSON.parse(response)
  end

def scryfall_api
    json = get_json('https://api.scryfall.com/cards/search?q=t%3Alegend')
    puts json
end

scryfall_api