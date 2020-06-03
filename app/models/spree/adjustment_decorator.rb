Spree::Adjustment.class_eval do
  # We always want tax adjustments to be "closed" because that tells Spree not to try to recalculate them automatically.
  validates(
    :finalized,
    {
      inclusion: {
        in: [true],
        message: "Tax adjustments must always be finalized for Avatax",
      },
      if: :tax?
    }
  )

  if !defined?(Spree::Adjustment.non_tax) # Spree 2.4+ has this scope already
    scope :non_tax, -> do
      source_type = arel_table[:source_type]
      where(source_type.not_eq('Spree::TaxRate').or source_type.eq(nil))
    end
  end

end
