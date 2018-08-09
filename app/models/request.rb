class Request < ApplicationRecord
  belongs_to :user
  belongs_to :design

  enum kind: [:original, :improve]
end
