class Trajeto < ApplicationRecord
    has_many :local_intermediarios
    accepts_nested_attributes_for :local_intermediarios, reject_if: :all_blank, allow_destroy: true
end
