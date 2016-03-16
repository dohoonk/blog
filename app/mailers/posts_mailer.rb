class PostsMailer < ApplicationMailer
  def notify_post_owner(comment)
    @post = comment.post
    @owner = @post.user
    @comment = comment
    mail(to: @owner.email, subject: "You got a message")
  end
end
