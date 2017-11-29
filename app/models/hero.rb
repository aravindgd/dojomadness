class Hero < ApplicationRecord
  has_many :abilities, inverse_of: :hero
end
