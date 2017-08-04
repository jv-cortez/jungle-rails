class EmailOrderReceiptPreview < ActionMailer::Preview

  def welcome_email
    EmailOrderReceipt.welcome_email(Order.first)
  end
end