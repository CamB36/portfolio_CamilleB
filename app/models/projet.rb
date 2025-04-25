class Projet < ApplicationRecord
  has_and_belongs_to_many :competences
end
