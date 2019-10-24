class PagesController < ApplicationController
  def index
    @images = scryfall_api
  end




  # helper methods for M:tG Scryfall API for card images
  # (methods copied from magic-art.rb)

  def get_json(url)
    response = RestClient.get(url)
    json = JSON.parse(response)
  end
  
  def parse_cards(json, img_array)
    data_array = json["data"]
    data_array.each do |card_hash|
      if card_hash["image_uris"]
        # puts card_hash["image_uris"]["art_crop"]
        img_array << card_hash["image_uris"]["art_crop"]
      end
    end

    if json["next_page"]
      get_json(json["next_page"])
      parse_cards(json, img_array)
    end
  end
  
  def scryfall_api
    api_url = "https://api.scryfall.com/cards/search?q="
    img_array = []
    creature_array = ["merfolk", "goblin", "sliver", "angel"]

    creature_array.each do |creature_str|
      search_url = api_url + "t%3Alegend+t%3A" + creature_str
      # puts url
      json = get_json(search_url)
      parse_cards(json, img_array)

      sleep(0.1)  # per the API documentation: https://scryfall.com/docs/api
    end

    img_array
  end
end
