class CategoryController < ApplicationController
  def show
    WillPaginate::ViewHelpers.pagination_options[:inner_window] = 1
    WillPaginate::ViewHelpers.pagination_options[:outer_window] = 1
    @currentPage = params[:page].to_i
    if @currentPage == 0
      @currentPage = 1
    end
    @category = Category.find_by_id(params[:categoryid])
    if @category.nil?
      cookie_flash_add(error: "No category found!")
      redirect_to root_url and return
    end
    @products = Product.page('category_id=' + @category[:id].to_s, @currentPage, 30)
  end

  def user_products
    WillPaginate::ViewHelpers.pagination_options[:inner_window] = 1
    WillPaginate::ViewHelpers.pagination_options[:outer_window] = 1
    @currentPage = params[:page].to_i
    if @currentPage == 0
      @currentPage = 1
    end
    @products = Product.page('user_id=' + session[:userid].to_s, @currentPage, 30)
  end
end
