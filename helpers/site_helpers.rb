module SiteHelpers

  def page_title
    title = @page_title ? @page_title : I18n.t('meta.title')
    [title, I18n.t('company_name')].join ' | '
  end

  def page_description
    if data.page.description
      description = data.page.description
    else
      description = I18n.t('meta.description')
    end
    description
  end

  def page_keywords
    @keywords || I18n.t('meta.keywords')
  end
end