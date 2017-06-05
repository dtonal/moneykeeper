class Market < ActiveRecord::Base
  def self.categories
    ['Lebensmittel', 'Hobby Maria', 'Haushalt', 'Hobby Torben', 'Sonstiges']
  end
end
