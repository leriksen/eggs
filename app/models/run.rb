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

  EGGS_PER_TRAY = 30

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
        end
      end
    end
  end

  build_virtual_attrs

  def extract_run(run_params)

    self.delivered = (run_params[:delivered_trays].to_i * 36) + run_params[:delivered_singles].to_i
    self.standard  = (run_params[:standard_trays].to_i  * 36) + run_params[:standard_singles].to_i
    self.jumbo     = (run_params[:jumbo_trays].to_i     * 36) + run_params[:jumbo_singles].to_i
    self.seconds   = (run_params[:seconds_trays].to_i   * 36) + run_params[:seconds_singles].to_i

    self.waste = self.delivered - self.standard - self.jumbo - self.seconds
    
    self.run_type_id = run_params[:run_type_id]
    self.flock_id = run_params[:flock_id]
    self.user_id = run_params[:user_id]
    self.active = run_params[:active]
  end

  def waste_percentage
    (waste.to_f/delivered.to_f) * 100.0
  end
end
