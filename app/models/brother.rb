class Brother < ActiveRecord::Base
  belongs_to :family
  belongs_to :branch
  belongs_to :rush_class
  has_ancestry
end
