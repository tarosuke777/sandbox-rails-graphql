module Resolvers
  class UserResolver < BaseResolver
    description 'Find a user by ID'
    type Types::UserType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      User.find(id)
    end
  end
end