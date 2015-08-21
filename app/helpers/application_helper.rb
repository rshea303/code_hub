module ApplicationHelper
  def format_date(review)
    review.created_at.strftime("%B %d, %Y")
  end
end
