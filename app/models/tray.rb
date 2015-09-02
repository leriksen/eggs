class Tray < ActiveRecord::Base
  belongs_to :shed
  belongs_to :user
end
