class StopSerializer < ActiveModel::Serializer
  attributes :stop_id, :stop_name, :stop_lat, :stop_lon

  has_many :songs
end
