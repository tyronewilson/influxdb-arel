module InfluxDB
  module Arel
    module Nodes
      class Unary < Node
        attr_accessor :expr
        alias :value :expr

        def initialize(expr)
          super()
          expr = expr.to_s if Symbol === expr
          self.expr = expr
        end

        def initialize_copy(other)
          super
          self.expr = expr.safe_clone if expr
        end

        def hash
          self.expr.hash
        end

        def eql?(other)
          self.class == other.class && expr == other.expr
        end

        alias :== :eql?
      end

      %w{
        Group
        Limit
        Fill
        Into
      }.each do |name|
        const_set(name, Class.new(Unary))
      end
    end
  end
end
