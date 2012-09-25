class AddDescriptionToProducts < ActiveRecord::Migration
  def change
    add_column :products, :last_updated,                        :datetime
    add_column :products, :description,                         :text
    add_column :products, :short_description,                   :text
    add_column :products, :image_path,                          :string
    add_column :products, :url,                                 :string
    add_column :products, :intro_apr,                           :string
    add_column :products, :q_intro_apr,                         :string
    add_column :products, :intro_apr_period,                    :string
    add_column :products, :q_intro_apr_period,                    :string
    add_column :products, :regular_apr,                         :string
    add_column :products, :q_regular_apr,                       :string
    add_column :products, :annual_fee,                          :string
    add_column :products, :q_annual_fee,                        :string
    add_column :products, :credit_needed,                       :string
    add_column :products, :q_credit_needed,                     :string
    add_column :products, :balance_transfers,                   :string
    add_column :products, :q_balance_transfers,                 :string
    add_column :products, :transfer_fee_pin,                    :string
    add_column :products, :q_transfer_fee_pin,                  :string
    add_column :products, :transaction_fee_signature,           :string
    add_column :products, :q_transaction_fee_signature,         :string
    add_column :products, :load_fee,                            :string
    add_column :products, :q_load_fee,                          :string
    add_column :products, :atm_fee,                             :string
    add_column :products, :q_atm_fee,                           :string
    add_column :products, :activation_fee,                      :string
    add_column :products, :q_activation_fee,                    :string
    add_column :products, :balance_transfer_intro_apr,          :string
    add_column :products, :q_balance_transfer_intro_apr,        :string
    add_column :products, :balance_transfer_intro_apr_period,   :string
    add_column :products, :q_balance_transfer_intro_apr_period, :string
    add_column :products, :balance_transfer_goto_rate,          :string
    add_column :products, :q_balance_transfer_goto_rate,        :string
    add_column :products, :cash_advance_goto_rate,              :string
    add_column :products, :q_cash_advance_goto_rate,            :string
    add_column :products, :penalty_goto_rate,                   :string
    add_column :products, :q_penalty_goto_rate,                 :string
    add_column :products, :late_fee,                            :string
    add_column :products, :q_late_fee,                          :string
    add_column :products, :cash_advance_fee,                    :string
    add_column :products, :q_cash_advance_fee,                  :string
    add_column :products, :balance_transfer_fee,                :string
    add_column :products, :q_balance_transfer_fee,              :string
    add_column :products, :foreign_currency_exchange_fee,       :string
    add_column :products, :q_foreign_currency_exchange_fee,     :string
    add_column :products, :issuer,                              :string
  end                                         
end
