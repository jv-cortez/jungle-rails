class EmailOrderReceipt < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def welcome_email(order)
    @order = order
    mail(to: @order.email, subject: `Order receipt #{@order.id}`)
  end
end
