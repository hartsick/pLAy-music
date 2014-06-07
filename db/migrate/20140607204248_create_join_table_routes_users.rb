class CreateJoinTableRoutesUsers < ActiveRecord::Migration
  def change
    create_join_table :routes, :users do |t|
      # t.index [:route_id, :user_id]
      t.index [:user_id, :route_id]
    end
  end
end
