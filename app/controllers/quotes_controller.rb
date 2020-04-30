class QuotesController < ApplicationController

  def index
      @quote = Quote.order("RANDOM()").first
  end
  
  def create
    @quote = Quote.create(quote_params)
    if @quote.valid?
      flash[:success] = '<strong>Quote successfully saved onto the database.</strong>'
    else  @quote.invalid?
      flash[:error] = '<strong>Could not Save,</strong> the data you entered is invalid.'
    end
    redirect_to root_path
    
  end

  def about
  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end

end
