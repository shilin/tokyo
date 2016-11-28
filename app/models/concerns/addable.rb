module Addable
  extend ActiveSupport::Concern

  included do
    has_many :additives, as: :addable
  end
end
