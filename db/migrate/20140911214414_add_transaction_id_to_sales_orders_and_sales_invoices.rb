class AddTransactionIdToSalesOrdersAndSalesInvoices < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_avatax_sales_orders, :transaction_id, :string
    add_column :spree_avatax_sales_invoices, :transaction_id, :string
  end
end
