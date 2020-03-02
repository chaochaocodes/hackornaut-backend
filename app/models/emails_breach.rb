class EmailsBreach < ApplicationRecord
    belongs_to :email 
    belongs_to :breach
end
