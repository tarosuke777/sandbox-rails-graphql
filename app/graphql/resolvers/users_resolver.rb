module Resolvers
  class UsersResolver < BaseResolver
    description 'Find users'
    type [Types::UserType], null: false
    
    def resolve
      User.all
    end
  end
end