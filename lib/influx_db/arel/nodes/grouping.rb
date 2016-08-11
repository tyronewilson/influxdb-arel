module Influxdb
  module Arel
    module Nodes
      class Grouping < Unary
        include Extensions::Predications
        include Extensions::AliasPredication
        include Extensions::Expressions
      end
    end
  end
end
