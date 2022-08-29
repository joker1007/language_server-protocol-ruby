module LanguageServer
  module Protocol
    module Interface
      #
      # Parameters of the document diagnostic request.
      #
      # @since 3.17.0
      #
      class DocumentDiagnosticParams
        def initialize(text_document:, identifier: nil, previous_result_id: nil, work_done_token: nil, partial_result_token: nil)
          @attributes = {}

          @attributes[:textDocument] = text_document
          @attributes[:identifier] = identifier if identifier
          @attributes[:previousResultId] = previous_result_id if previous_result_id
          @attributes[:workDoneToken] = work_done_token if work_done_token
          @attributes[:partialResultToken] = partial_result_token if partial_result_token

          @attributes.freeze
        end

        #
        # The text document.
        #
        # @return [TextDocumentIdentifier]
        def text_document
          attributes.fetch(:textDocument)
        end

        #
        # The additional identifier  provided during registration.
        #
        # @return [string | nil]
        def identifier
          attributes.fetch(:identifier)
        end

        #
        # The result id of a previous response if provided.
        #
        # @return [string | nil]
        def previous_result_id
          attributes.fetch(:previousResultId)
        end

        #
        # An optional token that a server can use to report work done progress.
        #
        # @return [ProgressToken | nil]
        def work_done_token
          attributes.fetch(:workDoneToken)
        end

        #
        # An optional token that a server can use to report partial results (e.g. streaming) to
        # the client.
        #
        # @return [ProgressToken | nil]
        def partial_result_token
          attributes.fetch(:partialResultToken)
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