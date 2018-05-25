class BooksController < ApplicationController
  def top
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @users = User.all

  end

  def show
  	@book = Book.find(params[:id])
    @user = current_user
    # @user = User.find_by(id: params[:id])
    # @user = User.find(user_id).name
    # @user = User.find(params[:id])
    @book = Book.new
  end

  def new
  	@book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    # if @book.save
    #       redirect_to books_path
    # else
    #       render :new
    # end
  	# book = Book.new(book_params)
    # book.save
    redirect_to book_path(book.id)
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id), notice: "Book was successfully updated."
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: "Book was successfully destroyed."
  end

  private
    def book_params
      params.require(:book).permit(:title, :body, :user_id)
    end

end
