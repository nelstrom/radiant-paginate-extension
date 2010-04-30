# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class PaginateExtension < Radiant::Extension
  version "1.0"
  description "Pagination with will_paginate"
  url "http://github.com/Aissac/radiant-paginate-extension"
  
  def activate 
    if Radiant::Config.table_exists?
      Radiant::Config['paginate.url_route'] = '' unless Radiant::Config['paginate.url_route']
      PaginateExtension.const_set('UrlCache', Radiant::Config['paginate.url_route'])
    end
    Page.send(:include, PaginatePageExtensions)
    # This makes the paginate <r:pages/> tag work in 0.6.9
    Page.send :include, ActionView::Helpers::TagHelper
  end
  
  def deactivate
  end
  
end
