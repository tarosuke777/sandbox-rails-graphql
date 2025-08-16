# frozen_string_literal: true

module Types
  class TrainingType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
  end
end
