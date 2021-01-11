class Item < ApplicationRecord
    belomgs_to :user
    has_one_attached :image
    # has_one :purchase

    
end
