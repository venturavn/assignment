class CategoryController < ApplicationController
  require "solr"
  require 'will_paginate/array'
    WillPaginate::ViewHelpers.pagination_options[:inner_window] = 1
    WillPaginate::ViewHelpers.pagination_options[:outer_window] = 1
  def show
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

  def search
    query = params[:q].to_s
    page = params[:page].to_i
    if page == 0
      page = 1
    end

    perpage = 30
    start = perpage * (page-1)

    solr = Solr::Connection.new('http://localhost:8080/apache-solr-3.6.2/')
    queryobj = Solr::Request::Select.new(nil, {'q' => "name:\"#{query}\" OR description:\"#{query}\"", 'rows' => perpage, 'start' => start})

    results = solr.send(queryobj).data["response"];
    @pages = (1..results["numFound"].to_i).to_a.paginate(page: page, per_page:perpage)
    @products = results["docs"]
    # @products = solr.query ("name:#{query}")
  end
end
