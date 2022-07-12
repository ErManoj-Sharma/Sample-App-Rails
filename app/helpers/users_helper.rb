# frozen_string_literal:true

# this helper module helps to generate gravatar
module UsersHelper
  def gravatar_for(user)
    # we can pass size:80 as parameter to change size
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: 'gravatar')
  end
end
