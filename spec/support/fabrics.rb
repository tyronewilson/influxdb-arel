module InfluxDB
  module Arel
    module RspecHelper
      def sql(value)
        node('SqlLiteral', value.to_s)
      end

      def node(class_name, *args)
        InfluxDB::Arel::Nodes.const_get(class_name).new(*args)
      end

      def builder(name = nil)
        InfluxDB::Arel::Builder.new(name)
      end

      def visitor
        InfluxDB::Arel::Visitor.new
      end
    end
  end
end
