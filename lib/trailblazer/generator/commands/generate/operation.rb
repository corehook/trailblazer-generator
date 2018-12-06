module Trailblazer
  # Trailblazer Generator
  class Generator
    # Generator commands registry
    module Commands
      # Generate Command
      module Generate
        # Generate Operation Command
        class Operation < Base
          desc "Generate a Trailblazer Operation"
          example [
            "trb generate operation Blog Create",
            "trb generate operation Blog Create --template=index",
            "trb generate operation Blog Create --layout=plural"
          ]

          # Required Arguments
          argument :concept, required: true, desc: ARGUMENT_CONCEPT
          argument :name, required: true, desc: ARGUMENT_NAME

          # Optional Arguments
          option :template, desc: OPTION_TEMPLATE
          option :layout, default: :singular, desc: OPTION_LAYOUT
          option :json, desc: OPTION_JSON
          option :path, desc: OPTION_PATH
          option :stubs, desc: OPTION_STUBS
          option :add_type_to_namespace, type: :boolean, desc: OPTION_ADD_TYPE_TO_NAMESPACE

          def call(concept:, **options)
            run_generator concept, :operation, options
            close_generator
          end
        end
      end
    end
  end
end
