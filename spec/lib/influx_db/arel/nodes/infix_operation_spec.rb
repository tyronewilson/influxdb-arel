require 'spec_helper'

describe InfluxDB::Arel::Nodes::Multiplication do
  it_should_behave_like :infix_operation_node, :Multiplication, 'left * right'
end

describe InfluxDB::Arel::Nodes::Division do
  it_should_behave_like :infix_operation_node, :Division, 'left / right'
end

describe InfluxDB::Arel::Nodes::Addition do
  it_should_behave_like :infix_operation_node, :Addition, 'left + right'
end

describe InfluxDB::Arel::Nodes::Subtraction do
  it_should_behave_like :infix_operation_node, :Subtraction, 'left - right'
end
