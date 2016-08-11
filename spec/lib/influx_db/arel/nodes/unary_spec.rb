require 'spec_helper'

describe InfluxDB::Arel::Nodes::Unary do
  it_should_behave_like :unary_node, :Unary
end

describe InfluxDB::Arel::Nodes::Group do
  it_should_behave_like :unary_node, :Group, 'value'
end

describe InfluxDB::Arel::Nodes::Limit do
  it_should_behave_like :unary_node, :Limit, 'LIMIT value'
end

describe InfluxDB::Arel::Nodes::Fill do
  it_should_behave_like :unary_node, :Fill, 'fill(value)'
end

describe InfluxDB::Arel::Nodes::Into do
  it_should_behave_like :unary_node, :Into, 'INTO value'
end
