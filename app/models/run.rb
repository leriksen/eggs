class Run < ActiveRecord::Base
  belongs_to :flock
  belongs_to :user
  belongs_to :run_type

  scope :active, -> {where(active: true)}
  scope :inactive, -> {where(active: false)}

  validates :standard, numericality: {
                                      only_integer: true,
                                      greater_than_or_equal_to: 0
                                    }
  validates :waste, numericality: {
                                    only_integer: true,
                                    greater_than_or_equal_to: 0
                                  }
  validates :delivered, numericality: {
                                      only_integer: true,
                                      greater_than_or_equal_to: 0
                                    }
  validates :seconds, numericality: {
                                    only_integer: true,
                                    greater_than_or_equal_to: 0
                                  }
  validates :jumbo, numericality: {
                                    only_integer: true,
                                    greater_than_or_equal_to: 0
                                  }

  EGGS_PER_TRAY = 36

  class << self
    def build_virtual_attrs
      %w(delivered standard seconds jumbo).each do |type|
        %w(trays singles).each do |amount|
          define_method "#{type}_#{amount}" do
            value = send("#{type}")
            case amount
            when "trays"
              value.present? ? (value / EGGS_PER_TRAY).to_i : 0
            when "singles"
              value.present? ? value % EGGS_PER_TRAY : 0
            end
          end

          define_method "#{type}_#{amount}=" do |new_value|
            value = send("#{type}")
            value ||= 0
            new_value = new_value.to_i
            case amount
            when "trays"
              value += new_value * EGGS_PER_TRAY
            when "singles"
              value += new_value
            end
            send("#{type}=", value)
            save
          end
        end
      end
    end
  end

  build_virtual_attrs

end
