module CommentsHelper
  def get_indentation(comment, indentation = 0)
    if comment.parent_comment?
      indentation
    elsif Comment.find(comment.in_reply_to).parent_comment?	
      indentation = indentation + 5
    else
      indentation = get_indentation(Comment.find(comment.in_reply_to)) + 5
    end
  end
end
