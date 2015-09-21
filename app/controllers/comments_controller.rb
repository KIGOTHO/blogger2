
  @comment.save

  redirect_to article_path(@comment.article)
end
    def comment_params
  params.require(:comment).permit(:author_name, :body)
end
 
end
