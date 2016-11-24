class Core < ActiveRecord::Base
  has_many :dishes

  validates :name, presence: true
end
