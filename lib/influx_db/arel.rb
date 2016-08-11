require 'date'
require 'time'
require "influx_db/arel/version"
require 'influx_db/arel/core_extensions'
require 'influx_db/arel/extensions'
require 'influx_db/arel/clauses'
require 'influx_db/arel/builder'

require 'influx_db/arel/visitor'
require 'influx_db/arel/visitor/where_statement'
require 'influx_db/arel/visitor/select_statement'
require 'influx_db/arel/visitor/delete_statement'

require 'influx_db/arel/tree_manager'
require 'influx_db/arel/select_manager'
require 'influx_db/arel/delete_manager'
require 'influx_db/arel/nodes'
require 'influx_db/arel/quoter'

module InfluxDB
  module Arel
    extend self

    STRING_OR_SYMBOL_CLASS = [Symbol, String]

    def sql(raw_sql)
      Nodes::SqlLiteral.new(raw_sql.to_s)
    end

    def star
      sql('*')
    end

    def arelize(expr, &block)
      block ||= ->(e){ Arel.sql(e.to_s) }

      case expr
      when Array
        expr.map{|value| arelize(value, &block) }.compact
      when Hash
        # TODO: Needs to convert Hash into sql node
      when *STRING_OR_SYMBOL_CLASS
        block.call(expr)
      else
        expr
      end
    end
  end
end
