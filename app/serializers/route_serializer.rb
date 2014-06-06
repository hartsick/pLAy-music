class RouteSerializer < ActiveModel::Serializer
  attributes :id, :route_id, :route_short_name, :route_long_name, :route_desc

  has_many :stops
end
