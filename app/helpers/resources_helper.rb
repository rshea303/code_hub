module ResourcesHelper
  def format_rating(resource)
    if resource.poor?
      content_tag(:strong, "Poor")
    else
      resource.rating
    end
  end
end
