module ApplicationHelper
  
  def full_title(page_title)
    base_title = "Welcome to RD Cars"
    if(page_title.empty?)
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  # Returns the Gravatar (http://gravatar.com/) for the given user.
   def gravatar_for(email)
     gravatar_id = Digest::MD5::hexdigest(email.downcase)
     gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
     image_tag(gravatar_url, alt: "tuo", class: "gravatar")
   end
  
end
