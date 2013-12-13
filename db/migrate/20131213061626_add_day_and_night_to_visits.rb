class AddDayAndNightToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :day, :boolean, :default => false
    add_column :visits, :night, :boolean, :default => false
  end
end
