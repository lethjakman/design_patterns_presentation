class Invoice
  attr_reader :invoice
  def initialize args
    @title = args[:title]
    @price = args[:price]
    @invoice = ''
  end


  def generate_invoice
    generate_start
    generate_title
    generate_welcome
    generate_price
    generate_adieu
    generate_end
  end

  protected
  def add_to_invoice(data)
    @invoice += data
    @invoice += "\n"
  end

  def generate_start
  end

  def generate_title
  end

  def generate_welcome
  end

  def generate_price
  end

  def generate_adieu
  end

  def generate_end
  end
end

class HtmlInvoice < Invoice
  def generate_start
    add_to_invoice "<html><body>"
  end

  def generate_title
    add_to_invoice "<h1>#{@title}</h1>"
  end

  def generate_welcome
    add_to_invoice "<h2>We are pleased to be working with you!</h2>"
  end

  def generate_price
    add_to_invoice "<div>Your work will cost $#{@price}</div>"
  end

  def generate_adieu
    add_to_invoice "<div>Thank you for your business!</div>"
  end

  def generate_end
    add_to_invoice "</body></html>"
  end
end

class PlainTextInvoice < Invoice
  def generate_start
    add_to_invoice "*********************"
  end

  def generate_title
    add_to_invoice "#{@title}"
  end

  def generate_welcome
    add_to_invoice "We are pleased to be working with you!"
  end

  def generate_price
    add_to_invoice "Your work will cost $#{@price}"
  end

  def generate_adieu
    add_to_invoice "Thank you for your business!"
  end

  def generate_end
    add_to_invoice "*********************"
  end
end

invoice_details = {price: 1000000, title: 'Alex LLC'}

gets
html_invoice = HtmlInvoice.new invoice_details
html_invoice.generate_invoice
puts html_invoice.invoice

gets
text_invoice = PlainTextInvoice.new invoice_details
text_invoice.generate_invoice
puts text_invoice.invoice
