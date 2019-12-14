class ProductsController < ApplicationController
  def top
  	@genres = Genre.all
  # urlにgenre_id(params)がある場合
  	if params[:genre_id]
  		# Genreのデータベースのテーブルから一致するidを取得
  		genre = Genre.find(params[:genre_id])
  		# Genreのデータベースのテーブルから一致するidを取得
  		@products = genre.products
  	else
  		 # 投稿すべてを取得
  		@products = Product.all
  	end
  end
  def create
    @product = Product.new(product_params)
    @product.save
  end
  def show
  end
end
