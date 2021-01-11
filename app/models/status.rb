class Status < ActiveHash::Base
    self.data = [
        { id: 1, name: '--' },
        { id: 2, name: 'item1' },
        { id: 3, name: 'item2' },
        { id: 4, name: 'item3' },
    ]

    include ActiveHash::Associations
    has_many :items
end