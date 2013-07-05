class UserMailer < ActionMailer::Base
  default from: "quangbuule@gmail.com"
  def purchase (user)
    if user.nil?
      return
    end
    @products = Product.find_by_sql "SELECT * FROM cartitems AS CI LEFT JOIN (SELECT p.id, p.name, p.price_value, p.price_currency FROM products AS p) AS P ON CI.product_id=P.id WHERE CI.user_id=#{user[:id]}"

    mail to: user[:email], subject: "You have ordered something on VenShop"
  end
end
