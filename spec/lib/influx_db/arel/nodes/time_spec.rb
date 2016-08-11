require 'spec_helper'

describe InfluxDB::Arel::Nodes::Time do
  it_should_behave_like :unary_node, :Time, 'time(value)'
end
