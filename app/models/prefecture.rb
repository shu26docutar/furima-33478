class Prefecture < ActiveHash::Base
    self.data = [
        { id: 1, name: '--' },
        { id: 2, name: '大阪' },
        { id: 3, name: '京都' },
        { id: 4, name: '兵庫' },
    ]

    include ActiveHash::Associations
    has_many :items
end