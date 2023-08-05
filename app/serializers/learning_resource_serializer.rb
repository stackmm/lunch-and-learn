class LearningResourceSerializer
  include JSONAPI::Serializer
  set_id :id
  set_type :learning_resource
  attributes :country, :video, :images
end