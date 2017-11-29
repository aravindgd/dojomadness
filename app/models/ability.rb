class Ability < ApplicationRecord
  belongs_to :hero, inverse_of: :abilities
end
