module LanguageServer
  module Protocol
    module Interface
      #
      # Represents an outgoing call, e.g. calling a getter from a method or a method from a constructor etc.
      #
      # @since 3.16.0
      #
      class CallHierarchyOutgoingCall
        def initialize(to:, from_ranges:)
          @attributes = {}

          @attributes[:to] = to
          @attributes[:fromRanges] = from_ranges

          @attributes.freeze
        end

        #
        # The item that is called.
        #
        # @return [CallHierarchyItem]
        def to
          attributes.fetch(:to)
        end

        #
        # The range at which this item is called. This is the range relative to the caller, e.g the item
        # passed to [`provideCallHierarchyOutgoingCalls`](#CallHierarchyItemProvider.provideCallHierarchyOutgoingCalls)
        # and not [`this.to`](#CallHierarchyOutgoingCall.to).
        #
        # @return [Range[]]
        def from_ranges
          attributes.fetch(:fromRanges)
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
