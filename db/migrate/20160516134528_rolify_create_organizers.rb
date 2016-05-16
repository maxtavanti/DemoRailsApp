class RolifyCreateOrganizers < ActiveRecord::Migration
  def change
    create_table(:organizers) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:users_organizers, :id => false) do |t|
      t.references :user
      t.references :organizer
    end

    add_index(:organizers, :name)
    add_index(:organizers, [ :name, :resource_type, :resource_id ])
    add_index(:users_organizers, [ :user_id, :organizer_id ])
  end
end
