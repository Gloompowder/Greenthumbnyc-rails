class Garden < ApplicationRecord
    has_many :visits
    has_many :gardens, through: :visits
end
