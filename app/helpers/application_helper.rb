
module ApplicationHelper
  def page_title
    title = "ベジ食べる"
    title = @page_title + " - " + title if @page_title
    title
  end

  def menu_link_to(text, path)
    link_to_unless_current(text, path) { content_tag(:span, text) }
  end

  def food_image_tag(food, options = {})
    if food.image.present?
      path = food_path(food, format: food.image.extension)
      link_to(image_tag(path, { alt: food.name }.merge(options)), path)
    else
      image_tag("logo.png", size: "150x120")
    end
  end
end
