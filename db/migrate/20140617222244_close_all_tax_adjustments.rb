class CloseAllTaxAdjustments < ActiveRecord::Migration[5.1]
  def up
    Spree::Adjustment.tax.update_all(finalized: true)
  end
end
