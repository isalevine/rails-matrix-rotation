require_relative './config/environment.rb'

def get_json(url)
    response = RestClient.get(url)
    json = JSON.parse(response)
end

def parse_cards(json)
    array = json["data"]
    array.each do |card_hash|
        if card_hash["image_uris"]
            puts card_hash["image_uris"]["art_crop"]
        end
    end
end

def scryfall_api
    json = get_json('https://api.scryfall.com/cards/search?q=t%3Alegend')
    parse_cards(json)
    # puts json
end

scryfall_api