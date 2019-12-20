FactoryBot.define do
  sequence(:doc_id) { |n| n.to_s.rjust(16, '0') }

  factory :avatax_tax_calculator, class: SpreeAvatax::Calculator do
  end

  factory :avatax_sales_invoice, class: SpreeAvatax::SalesInvoice do
    association :order, factory: :shipped_order
    doc_id { generate(:doc_id) }
    doc_code { order.number }
    doc_date { order.completed_at.try(:to_date) || 1.day.ago }
    pre_tax_total { order.total - order.additional_tax_total }
    additional_tax_total { order.additional_tax_total }
  end

  factory :return_invoice, class: SpreeAvatax::ReturnInvoice do
    association :reimbursement
    committed false
    doc_id { generate(:doc_id) }
    doc_code { reimbursement.number }
    doc_date { reimbursement.order.avatax_invoice_at.try(:to_date) || reimbursement.order.completed_at.to_date }
    pre_tax_total { reimbursement.return_items.sum(:amount) }
    additional_tax_total { reimbursement.return_items.sum(:additional_tax_total) }
  end

  factory :avatax_config, class: SpreeAvatax::Config do
    enabled true
    timeout SpreeAvatax::Config::DEFAULT_TIMEOUT
  end
end
