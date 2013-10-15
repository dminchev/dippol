module SiteHelpers

  def page_title
    title = "GPS Online Tracking Systems Dippol"
    if data.page.title
      title << " | " + data.page.title
    end
    title
  end
  
  def page_description
    if data.page.description
      description = data.page.description
    else
      description = "GPS online tracking systems for monitoring your vehicles and cargos."
    end
    description
  end

end