class UpdateAvataxCalculatorType < ActiveRecord::Migration[5.1]
  def up
    Spree::Calculator.where(
      type: "SpreeAvatax::Calculator"
    ).update_all(
      type: "Spree::Calculator::Avatax"
    )
  end

  def down
    Spree::Calculator.where(
      type: "Spree::Calculator::Avatax"
    ).update_all(
      type: "SpreeAvatax::Calculator"
    )
  end
end
