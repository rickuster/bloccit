module UsersHelper
  def check_and_list_posts(user)
    if @user.posts.empty?
      "#{user.name} has not submitted any posts yet."
    else
      render @user.posts
    end
  end

  def check_and_list_comments(user)
    if @user.comments.empty?
      "#{user.name} has not submitted any comments yet."
    else
      render @user.comments
    end
  end
end
