module ApplicationHelper

  # Retourne un titre complet par pages
  def full_title(page_title = '')
  # page_title est par défault une chaine de caractère vide
    base_title = "Sample App"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

end
