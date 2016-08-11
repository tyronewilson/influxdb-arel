require 'bigdecimal'

module InfluxDB
  module Arel
    module Quoter
      extend self

      class Repository
        def initialize
          @types = {}
        end

        def add(type, &block)
          @types[type] = block
        end

        def quote(value)
          block = @types[value.class]
          block ? block.call(value) : value.inspect
        end
      end

      def repository
        @repository ||= Repository.new
      end

      def repository=(value)
        @repository = value
      end

      def quote(value)
        repository.quote(value)
      end

      def add_type(type, &block)
        repository.add(type, &block)
      end
    end

    Quoter.add_type(String) do |value|
      "'#{value}'"
    end

    Quoter.add_type(Time) do |value|
      "'#{value.utc.strftime('%Y-%m-%d %H:%M:%S')}'"
    end

    Quoter.add_type(Date) do |value|
      "'#{value.to_time.utc.strftime('%Y-%m-%d')}'"
    end

    Quoter.add_type(DateTime) do |value|
      "'#{value.to_time.utc.strftime('%Y-%m-%d %H:%M:%S')}'"
    end

    Quoter.add_type(BigDecimal) do |value|
      value.to_s('F')
    end

    Quoter.add_type(NilClass) do |value|
      'null'
    end

    Quoter.add_type(Hash) do |value|
      value = value.to_json if value.respond_to?(:to_json)
      value.to_s
    end

    Quoter.add_type(Nodes::SqlLiteral) do |value|
      value
    end

    if defined?(ActiveSupport::Multibyte::Chars)
      Quoter.add_type(ActiveSupport::Multibyte::Chars) do |value|
        "'#{value}'"
      end
    end

    if defined?(ActiveSupport::StringInquirer)
      Quoter.add_type(ActiveSupport::StringInquirer) do |value|
        "'#{value}'"
      end
    end
  end
end
