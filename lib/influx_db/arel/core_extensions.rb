class Integer
  def u
    InfluxDB::Arel::Nodes::Duration.new(self, 'u')
  end

  def s
    InfluxDB::Arel::Nodes::Duration.new(self, 's')
  end

  def m
    InfluxDB::Arel::Nodes::Duration.new(self, 'm')
  end

  def h
    InfluxDB::Arel::Nodes::Duration.new(self, 'h')
  end

  def d
    InfluxDB::Arel::Nodes::Duration.new(self, 'd')
  end

  def w
    InfluxDB::Arel::Nodes::Duration.new(self, 'w')
  end
end

class Object
  def safe_clone
    self.clone
  rescue SecurityError, TypeError => e
    self
  end
end
