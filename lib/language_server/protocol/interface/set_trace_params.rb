module LanguageServer
  module Protocol
    module Interface
      class SetTraceParams
        def initialize(value:)
          @attributes = {}

          @attributes[:value] = value

          @attributes.freeze
        end

        # @return [TraceValues]
        def value
          attributes.fetch(:value)
        end

        attr_reader :attributes

        def to_hash
          attributes
        end

        def to_json(*args)
          to_hash.to_json(*args)
        end
      end
    end
  end
end
