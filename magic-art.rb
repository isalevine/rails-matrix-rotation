require_relative './config/environment.rb'

API_URL = "https://api.scryfall.com/cards/search?q="

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

    if json["next_page"]
        get_json(json["next_page"])
        parse_cards(json)
    end
end

def scryfall_api
    creature_array = ["merfolk", "goblin", "sliver", "angel"]
    creature_array.each do |creature_str|
        url = API_URL + "t%3Alegend+t%3A" + creature_str
        # puts url
        json = get_json(url)
        parse_cards(json)

        sleep(0.1)  # per the API documentation: https://scryfall.com/docs/api
    end
end

scryfall_api