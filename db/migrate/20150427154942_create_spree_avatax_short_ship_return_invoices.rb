class CreateSpreeAvataxShortShipReturnInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_avatax_short_ship_return_invoices do |t|
      t.boolean :committed, null: false
      t.string  :doc_id, null: false
      t.string  :doc_code, null: false
      t.date    :doc_date, null: false

      t.timestamps null: true
    end

    create_table :spree_avatax_short_ship_return_invoice_inventory_units do |t|
      t.references :short_ship_return_invoice,
                   index: {
                     name: 'index_spree_avatax_short_ships_on_invoice_id'
                   },
                   null: false
      t.references :inventory_unit,
                   index: { name: 'index_spree_avatax_short_ships_on_unit_id' },
                   null: false
    end

    # The default index names for these are too long for sqlite/mysql/postgres

    add_index(
      :spree_avatax_short_ship_return_invoices,
      :doc_id,
      unique: true,
      name: 'index_spree_avatax_short_invoices_on_doc_id',
    )
    add_index(
      :spree_avatax_short_ship_return_invoices,
      :doc_code,
      unique: true,
      name: 'index_spree_avatax_short_invoices_on_doc_code',
    )
  end
end
