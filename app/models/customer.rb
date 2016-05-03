class Customer < ActiveRecord::Base
	has_one :identity
	
	has_many :payment , :dependent => :destroy
	has_many :debt , :dependent => :destroy

end
