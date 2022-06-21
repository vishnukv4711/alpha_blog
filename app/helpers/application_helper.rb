module ApplicationHelper
  def gravatar_for(user, size = 80)
    email_address = user.email
    hash = Digest::MD5.hexdigest(email_address)
    gravatar_image = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_image,alt: user.username)
  end
end
