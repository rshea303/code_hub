class KeywordsController < ApplicationController
  def index
    @keyword = Keyword.new
    @keywords = Keyword.order_by_name
  end
  
  def new
    @keyword = Keyword.new
  end

  def create
    keyword = Keyword.new(keyword_params)
    if keyword.save
      redirect_to keywords_path, notice: "#{keyword.name} created successfully!"
    else
      render :new
    end
  end

  def edit
    @keyword = Keyword.find(params[:id])
  end
  
  def update
    keyword = Keyword.find(params[:id])
    if keyword.update(keyword_params)
      redirect_to keywords_path, notice: "#{keyword.name} updated successfully!"
    else
      flash.now[:alert] = "Keyword was not updated"
      render :edit
    end
  end
  
  def destroy
    keyword = Keyword.find(params[:id])
    keyword.destroy
    redirect_to keywords_path, notice: "#{keyword.name} deleted successfully!"
  end

  private

  def keyword_params
    params.require(:keyword).permit(:name)
  end
end
