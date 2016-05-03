class JunksController < ApplicationController

	def add
		for index in 0..5000
			
			identity = Identity.new
			identity.citizen_no = rand(10000000000...80000000000)
			identity.full_name  = "#{First.find(rand(1..5494)).firstname } #{Last.find(rand(1..88799)).lastname}"
			identity.birthdate  = DateTime.now.to_date - rand(19..70).years - rand(0..390).days
			identity.place_of_birth = rand(1..81)
			identity.mother_name = First.find(rand(1..5494)).firstname
			identity.father_name = First.find(rand(1..5494)).firstname
			identity.save

			customer = Customer.new
			customer.identity_id = identity.id
			customer.register_date = DateTime.now.to_date - rand(2..10).years - rand(0..390).days
			customer.status = true

			if rand(0..10) == 0
				customer.status = false
				customer.closing_date = customer.register_date + 1.year + rand(0..12).months
			end

			customer.save
			identity = Identity.find(identity.id)
			identity.customer_id = customer.id
			identity.save

			if(customer.status == true )
				for indexOfalive in 1..(((DateTime.now.to_date - customer.register_date) / 30 ).to_i)
					debt = Debt.new
					debt.customer = customer
					debt.billed_date = customer.register_date + indexOfalive.months
					debt.cost  = '%.2f' % rand(30..100.0)
					debt.taxes = ( debt.cost * 0.18 )
					unless rand(0..10) == 0
						debt.status = true
						debt.save

						payment = Payment.new
						payment.customer_id = customer.id
						payment.debt_id = debt.id
						payment.payment_date = debt.billed_date + rand(1..15).days
						payment.save

						debt = Debt.find(debt.id)
						debt.payment_id = payment.id
						debt.save

					else
						debt.status = false
						debt.save
					end
				end
			else
				for indexOfDead in 1..(((customer.closing_date - customer.register_date)/ 30).to_i)
					debt = Debt.new
					debt.customer_id = customer.id
					debt.billed_date = customer.register_date + indexOfDead.months
					debt.cost  = '%.2f' % rand(30..100.0)
					debt.taxes = ( debt.cost * 0.18 )
					unless rand(0..10) == 0
						debt.status = true
						debt.save

						payment = Payment.new
						payment.customer_id = customer.id
						payment.debt_id = debt.id
						payment.payment_date = debt.billed_date + rand(1..15).days
						payment.save

						debt = Debt.find(debt.id)
						debt.payment_id = payment.id
						debt.save
					end
					debt.status = false
					debt.save
				end
			end

			


		end
	end

end
