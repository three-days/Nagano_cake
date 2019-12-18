class ProductsController < ApplicationController
  def top
  	@genres = Genre.all
  # urlにgenre_id(params)がある場合
  	if params[:genre_id]
  		# Genreデータベースのテーブルから一致するidを取得
  		genre = Genre.find(params[:genre_id])
  		# ↓のジャンルに代入
  		@products = genre.products
  	else
  		 # genre_idが無いなら投稿すべてを取得
  		@products = Product.search(params[:search])
    end
  end

  def create
    @product = Product.new(product_params)
    @product.save
  end
  def show
    @genres = Genre.all
    @product = Product.find(params[:id])
  end
end
