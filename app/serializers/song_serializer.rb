class SongSerializer < ActiveModel::Serializer
  attributes :id, :lfid, :title, :artist_name, :rdio_id
end
