require 'spec_helper'

describe InfluxDB::Arel::Nodes::Grouping do
  let(:described_node){ node(:Grouping, sql('value')) }

  it_should_behave_like :unary_node, :Grouping, '(value)'
  it_should_behave_like :node_as, '(value)'
  it_should_behave_like :node_expressions, '(value)'
  it_should_behave_like :node_predications, '(value)'
end
