# encoding: utf-8
class ProductController < ApplicationController
  def show
    @product = Product.find_by_id(params[:productid])

    if @product.nil?
      cookie_flash_add(error: "No product found!")
      redirect_to root_url and return
    end

    if !@product[:image]
      @product[:image] = "http://i.yimg.jp/images/sh/noimage/146x146.gif"
    end

    @category = Category.find_by_id(@product[:category_id])
  end
  def add
    require_user(product_add_path) or return
    @product = Product.new
    @ckeditor = true
  end
  def create
    require_user(product_add_path) or return
    @product = Product.new(params[:product])
    @product[:user_id] = session[:userid]
    if @product.save
      cookie_flash_add(success: "Congratulation!! Your product have been posted in our site!")
      redirect_to action:'show', productid: @product.id
    else
      @product.price_value = @product.price_value.to_s + " JPY"
      render 'add'
    end
  end
end
