class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def preview
    @book = Book.new(params[:book])
  end

  def create
    @book = Book.new(params[:book])
    @book.quantity_left = @book.quantity
    if @book.save
      flash[:success] = "The book was saved successfully"
      redirect_to root_path
    else
      flash[:error] = "Please fill in the fields correctly"
      render :action => "new"
    end
  end

  def mybooks
    @checkouts = Checkout.where(user_id:session[:user_id])
  end

  def show
    @book = Book.find_by_isbn(params[:isbn])
    @checked_out_books = Checkout.where(book_id: @book.id)
    @waiting_list = Waitinglist.where(book_id: @book.id)
  end

  def edit
    @book = Book.find_by_isbn(params[:isbn])
  end

  def update
    @book = Book.find_by_isbn(params[:isbn])
    @book.quantity_left += ((params[:book][:quantity].to_i) - @book.quantity)
    @book.update_attributes(params[:book])
    redirect_to :action => "show"
  end

  def search
    query = {:isbn  =>  params[:search_book]}
    @results = Book.where(query)
  end
end
