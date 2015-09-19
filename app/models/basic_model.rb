class BasicModel
  include Mongoid::Document

  # Mongoid doesn't provide this helper method
  def self.column_names
    self.attribute_names.map(&:to_sym)
  end
end
