module ResourcesHelper
  def format_average_rating(resource)
    if resource.average_rating.nil?
      content_tag(:strong, "No Reviews")
    else
      number_with_precision(resource.average_rating, precision: 1)
    end
  end
end
