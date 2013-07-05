class CartController < ApplicationController
  def index
    require_user (cart_index_path) or return
    @products = Product.find_by_sql "SELECT * FROM cartitems AS CI LEFT JOIN (SELECT p.id, p.name, p.price_value, p.price_currency FROM products AS p) AS P ON CI.product_id=P.id WHERE CI.user_id=#{session[:userid]}"
  end
  def create
    if get_user.nil?
      return render json: {errorCode:1}
    end
    product_id = params[:productid].to_i
    quantity = params[:quantity].to_i

    product = Product.find_by_id (product_id)
    if product.nil?
      return render json: {errorCode:2}
    end
    cartitem_existed = Cartitem.find(:first, conditions:['product_id=' + product_id.to_s, 'user_id=' + @user.id.to_s])
    if cartitem_existed.nil?
      cartitem = Cartitem.new ({user_id: @user.id, product_id: product.id, quantity: quantity})
      if cartitem.save
        return render json: {errorCode:0, successCode:1}
      else
        return render json: {errorCode:3}
      end
    else
      cartitem_existed[:quantity] += quantity

      if cartitem_existed.save
        return render json: {errorCode:0, successCode:2}
      else
        return render json: {errorCode:3}
      end
    end
  end

  def edit
    if get_user.nil?
      return render json: {errorCode:1}
    end
    product_id = params[:productid].to_i
    quantity = params[:quantity].to_i

    cartitem_existed = Cartitem.find(:first, conditions:['product_id=' + product_id.to_s, 'user_id=' + @user.id.to_s])
    if cartitem_existed.nil?
      return render json: {errorCode:2}
    else
      cartitem_existed[:quantity] += quantity

      if cartitem_existed.save
        return render json: {errorCode:0, successCode:1}
      else
        return render json: {errorCode:3}
      end
    end
  end

  def delete
    if get_user.nil?
      return render json: {errorCode:1}
    end
    product_id = params[:productid].to_i
    Cartitem.where(product_id: product_id, user_id: @user.id).destroy_all
    render json: {}
  end

  def empty
    if get_user.nil?
      cookie_flash_add(error: "You haven't loged in yet!")
      return redirect_to root_path
    else
      Cartitem.where(user_id: @user.id).delete_all
      cookie_flash_add(success: "You have emptyed your Cart.")
      return redirect_to root_path
    end
  end

  def purchase
    if get_user.nil?
      cookie_flash_add(error: "You haven't loged in yet!")
      return redirect_to root_path
    else
      UserMailer.purchase(@user).deliver
      # Cartitem.where(user_id: @user.id).delete_all
      cookie_flash_add(success: "Thanks for purchasing! We have just sent you an email.")
      return redirect_to root_path
    end
  end

end
