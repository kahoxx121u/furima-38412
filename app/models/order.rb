class Order < ApplicationRecord

### Association
belongs_to :user
belongs_to :item
has_one :payment

end