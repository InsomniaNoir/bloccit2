class FavoriteMailer < ApplicationMailer
  default from: "jrshafer@mac.com"

  def new_comment(user, post, comment)

    #new headers
    headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.examle"
    headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subjet: "New comment on #{post.title}")
  end
end
