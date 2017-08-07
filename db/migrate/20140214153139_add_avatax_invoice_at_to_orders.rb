class AddAvataxInvoiceAtToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_orders, :avatax_invoice_at, :datetime
  end
end
