# frozen_string_literal: true

module Mutations
  class CreateUser < BaseMutation

    field :user, Types::UserType, null: true

    argument :name, String, required: true, description: "Name of the user."
    argument :email, String, required: false, description: "Email of the user."

    def resolve(name:, email: nil)
      user = User.new(name: name, email: email)

      if user.save
        { user: user }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    rescue StandardError => e
      { user: nil, errors: [e.message] }
    end

  end
end
