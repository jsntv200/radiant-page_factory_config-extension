module PageFactoryConfig
  module Admin::PagesController
    class PageFactoryConfigError < StandardError
      def initialize(message = 'There is an error in the factory-config'); super end
    end

    def self.included(base)
      base.class_eval do
        def new_with_factory_config
          if params[:page_id].present?
            begin
              if factory_config = YAML::load(Page.find(params[:page_id]).render_part('factory-config'))
                ['parts', 'fields', 'remove_parts', 'remove_fields'].each do |key|
                  if config = factory_config[key]
                    config.each do |value|
                      model_class.send(key.singularize, value.delete('name'), value)
                    end
                  end
                end

                model_class.layout(factory_config['layout'])
              end
            rescue
              raise PageFactoryConfigError
            end
          end

          new_without_factory_config
        end

        alias_method_chain :new, :factory_config
      end
    end

  end
end
