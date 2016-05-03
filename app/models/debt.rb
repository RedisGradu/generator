class Debt < ActiveRecord::Base
  belongs_to :customer
  has_one :payment

end