require 'cucumber/wire_support/request_handler'
require 'gherkin/formatter/argument'

module Cucumber
  module WireSupport
    module WireProtocol
      module Requests
        class StepMatches < RequestHandler
          def execute(name_to_match, name_to_report)
            @name_to_match, @name_to_report = name_to_match, name_to_report
            request_params = {
              :name_to_match => name_to_match
            }
            super(request_params)
          end

          def handle_success(params)
            params.map do |raw_step_match|
              create_step_match(raw_step_match)
            end
          end

          alias :handle_step_matches :handle_success

          private

          def create_step_match(raw_step_match)
            step_definition = WireStepDefinition.new(@connection, raw_step_match)
            step_args = raw_step_match['args'].map do |raw_arg|
              Gherkin::Formatter::Argument.new(raw_arg['pos'], raw_arg['val'])
            end
            step_match(step_definition, step_args)
          end

          def step_match(step_definition, step_args)
            StepMatch.new(step_definition, @name_to_match, @name_to_report, step_args)
          end
        end

        class SnippetText < RequestHandler
          def execute(step_keyword, step_name, multiline_arg_class_name)
            request_params = {
              :step_keyword => step_keyword,
              :step_name => step_name,
              :multiline_arg_class => multiline_arg_class_name
            }
            super(request_params)
          end

          def handle_success(snippet_text)
            snippet_text
          end

          alias :handle_snippet_text :handle_success
        end

        class Invoke < RequestHandler
          def execute(step_definition_id, args)
            request_params = {
              :id => step_definition_id,
              :args => args
            }
            super(request_params)
          end

          def handle_pending(message)
            raise Pending, message || "TODO"
          end

          def handle_diff!(tables)
            #??TODO: figure out if / how we could get a location for a table from the wire (or make a null location)
            location = Core::Ast::Location.new(__FILE__, __LINE__)
            table1 = table(tables[0], location)
            table2 = table(tables[1], location)
            table1.diff!(table2)
          end

          def handle_diff(tables)
            begin
              handle_diff!(tables)
            rescue Cucumber::MultilineArgument::DataTable::Different
              @connection.diff_failed
            end
            @connection.diff_ok
          end

          alias :handle_step_failed :handle_fail

          private

          def table(data, location)
            Cucumber::MultilineArgument.from_core(Core::Ast::DataTable.new(data, location))
          end
        end

        class DiffFailed < RequestHandler
          alias :handle_step_failed :handle_fail
        end

        class DiffOk < RequestHandler
          alias :handle_step_failed :handle_fail
        end

        module Tags
          def clean_tag_names(scenario)
            scenario.tags.map { |tag| tag.name.gsub(/^@/, '') }.sort
          end

          def request_params(scenario)
            return nil unless scenario.tags.any?
            { "tags" => clean_tag_names(scenario) }
          end
        end

        class BeginScenario < RequestHandler
          include Tags

          def execute(scenario)
            super(request_params(scenario))
          end
        end

        class EndScenario < RequestHandler
          include Tags

          def execute(scenario)
            super(request_params(scenario))
          end
        end
      end
    end
  end
end
