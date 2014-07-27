class CreateAdminRolesUsers < ActiveRecord::Migration
  def change
    create_table :admin_roles_users do |t|
      t.belongs_to :user
      t.belongs_to :role

      t.timestamps
    end
  end
end
