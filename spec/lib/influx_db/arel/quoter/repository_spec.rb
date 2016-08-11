require 'spec_helper'

describe InfluxDB::Arel::Quoter::Repository do
  subject{ InfluxDB::Arel::Quoter::Repository.new }

  before{ subject.add(String){|value| "quoted #{value}" } }

  specify{ expect(subject.quote('string')).to eq('quoted string') }
  specify{ expect(subject.quote(/.*/)).to eq('/.*/') }
end
