module UsersHelper

  def gravatar_for_user(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    gravatar_url = "avatar_placeholder.png" if(user.email.downcase.include? "example")
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end

end
