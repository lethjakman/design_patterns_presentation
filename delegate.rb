class Invoice
  def initialize args
    @processor = payment_processors[args[:payment_type]].new # EG. Credit card, Cash, Check
    @processor.payment_details = args[:payment_details] if args[:payment_details] # EG. CC_NUM
    @amount = args[:amount]
  end

  def payment_processors
    {
      credit_card: CreditCard,
      check: Check,
      cash: Cash
    }
  end

  def process_payment
    @processor.take_payment(@amount)
  end

  def payment_processor type
    payment_types =

    payment_types[type]
  end
end

class Invoice::CreditCard
  attr_accessor :payment_details
  def take_payment amount
    puts "We received a payment of $#{amount} from #{payment_details[:cc_name]}"
    puts 'We took their money from their credit card!'
    # CC_Service.take_money!(payment_details[:cc_number], payment_details[:cc_expire], payment_details[:cc_name])
  end
end

class Invoice::Check
  attr_accessor :payment_details

  def take_payment amount
    puts "We received $#{amount} from account number #{payment_details[:account_number]}"
    puts 'Now go to the bank and get the money!'
    # Log check was received
  end
end

class Invoice::Cash
  attr_accessor :payment_details

  def take_payment amount
    puts "We received a cash payment of $#{amount}"
    puts "Now put the money in the drawer"
    # Log money was received
  end
end


gets
puts "Credit Card"
cc_invoice = Invoice.new(
  payment_type: :credit_card,
  amount: 100,
  payment_details: {
    cc_number: 12345,
    cc_expire: '11/11',
    cc_name: 'John Smith'
  }
)
cc_invoice.process_payment

gets
check_invoice = Invoice.new(
  payment_type: :check,
  amount: 100,
  payment_details: {
    cc_number: 12345,
    cc_expire: '11/11',
    cc_name: 'John Smith'
  }
)
check_invoice.process_payment

gets
cash_invoice = Invoice.new payment_type: :cash, amount: 100
cash_invoice.process_payment

gets
