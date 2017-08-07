class AddSpreeAvataxConfigs < ActiveRecord::Migration[5.1]
  def change
    create_table 'spree_avatax_configs' do |t|
      t.boolean 'enabled', null: false
      t.float 'timeout', null: false

      t.datetime 'created_at', null: false
    end
  end
end
