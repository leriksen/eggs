class Report
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :flock_id, :from_date, :to_date

  def persisted?
    false
  end

  def id
    nil
  end
end
