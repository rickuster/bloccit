module ApplicationHelper
  def form_group_tag(errors, &block)
    css_class = 'form-group'
    css_class << 'has-error' if errors.any?

    content_tag :div, capture(&block), class: css_class
  end

  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
