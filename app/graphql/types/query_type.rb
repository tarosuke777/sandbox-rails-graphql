# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    # field :user, Types::UserType, null: false do
    #   argument :id, ID, required: true
    # end
    # def user(id:)
    #   User.find(id)
    # end

    field :user, resolver: Resolvers::UserResolver
    field :users, resolver: Resolvers::UsersResolver

    field :training, Types::TrainingType, null: false do
      argument :id, ID, required: true, description: "ID of the training."
    end
    def training(id:)
      training_map = {
        "1" => "run",
        "2" => "bike",
        "3" => "swim"
      }
      name = training_map[id] || "unknown"
      { id: id, name: name }
    end

    field :trainings, [Types::TrainingType], null: false,
      description: "Returns a list of all trainings."
    def trainings
      training_map = {
        "1" => "run",
        "2" => "bike",
        "3" => "swim"
      }
      # training_map.map do |id, name|
      #   { id: id, name: name }
      # end
      
      [
        { id: "1", name: "run" },
        { id: "2", name: "bike" },
        { id: "3", name: "swim" }
      ]
    end

  end
end
