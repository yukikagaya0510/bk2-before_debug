class BookCommentsController < ApplicationController

	def create
		@book = Book.find(params[:book_id])
		@comment = current_user.book_comments.new(book_comment_params)
		@comment.book_id = @book.id
		if @comment.save
		redirect_back(fallback_location: root_path)
	    else
	    @newbook = Book.new
        @user = @book.user
        @book = Book.find(params[:book_id])

	    render '/books/show'
	    end
	end

	def destroy
		book_comment = BookComment.find(params[:id])
		book_comment.destroy
		redirect_to book_path
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end
