module LanguageServer
  module Protocol
    module Interface
      #
      # @since 3.16.0
      #
      class SemanticTokensPartialResult
        def initialize(data:)
          @attributes = {}

          @attributes[:data] = data

          @attributes.freeze
        end

        # @return [uinteger[]]
        def data
          attributes.fetch(:data)
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
