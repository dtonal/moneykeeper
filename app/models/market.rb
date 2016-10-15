class Market < ActiveRecord::Base
  def self.categories
    ['Supermarkt', 'Discounter', 'Drogerie', 'Tiershop', 'Baumarkt', 'Möbelhaus', 'Buchhandlung', 'Restaurant', 'Fussball', 'Nähladen', 'Stricken', 'Tankstelle', 'Bioladen', 'Internet']
  end
end
