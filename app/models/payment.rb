class Payment < ActiveRecord::Base
  belongs_to :customer
  has_one :debt
end
