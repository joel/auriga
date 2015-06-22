class BasicModel
  include Mongoid::Document
  def self.column_names
    self.attribute_names.map(&:to_sym)
  end
end
