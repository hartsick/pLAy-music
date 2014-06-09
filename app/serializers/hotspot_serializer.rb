class HotspotSerializer < ActiveModel::Serializer
  attributes :id, :name, :hot_lat, :hot_lng
end
