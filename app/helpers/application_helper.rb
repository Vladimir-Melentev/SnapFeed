module ApplicationHelper

  def nav_tab(title, url, options = {})
    #ищем значение по ключу
    current_page = options.delete :current_page
    #деалем изменение цвета для текущей ссылки
    css_class = current_page == title ? 'text-white' : 'text-secondary'
    #если option присутствует добаляем к нему наш класс css
    options[:class] = if options[:class]
                        options[:class] + ' ' + css_class
                      else
                        css_class
                      end
    link_to title, url, options
  end

  def currently_at(current_page = "")
    render partial: 'shared/menu', locals: {current_page: current_page}
  end

  def full_title(page_title = "")
    base_title = "SnapFeed"
    if page_title.present?
      "#{page_title} | #{base_title}"
    else
      base_title
    end
  end
end
