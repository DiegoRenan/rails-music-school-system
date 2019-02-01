module ApplicationHelper
    def menu_principal(controllers)
      render partial: "menu_principal", locals: {opcoes: controllers}
    end
    
    def full_title(page_title = '')
      base_title = "Elite Musica"
      if page_title.empty?
        base_title
      else
        page_title+ "|" + base_title
      end
    end
    
end
