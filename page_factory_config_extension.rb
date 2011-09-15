require "radiant-page_factory_config-extension"

class PageFactoryConfigExtension < Radiant::Extension
  version     RadiantPageFactoryConfigExtension::VERSION
  description RadiantPageFactoryConfigExtension::DESCRIPTION
  url         RadiantPageFactoryConfigExtension::URL

  def activate
    Admin::PagesController.send :include, PageFactoryConfig::Admin::PagesController
  end
end
