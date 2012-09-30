class Product < ActiveRecord::Base
  attr_accessible :last_updated                              ,
                  :origin_id                                 ,
                  :name                                      ,
                  :description                               ,
                  :short_description                         ,
                  :image_path                                ,
                  :url                                       ,
                  :intro_apr                                 ,
                  :q_intro_apr                               ,
                  :intro_apr_period                          ,
                  :q_intro_apr_period                        ,
                  :regular_apr                               ,
                  :q_regular_apr                             ,
                  :annual_fee                                ,
                  :q_annual_fee                              ,
                  :credit_needed                             ,
                  :q_credit_needed                           ,
                  :balance_transfers                         ,
                  :q_balance_transfers                       ,
                  :transfer_fee_pin                          ,
                  :q_transfer_fee_pin                        ,
                  :transaction_fee_signature                 ,
                  :q_transaction_fee_signature               ,
                  :load_fee                                  ,
                  :q_load_fee                                ,
                  :atm_fee                                   ,
                  :q_atm_fee                                 ,
                  :activation_fee                            ,
                  :q_activation_fee                          ,
                  :balance_transfer_intro_apr                ,
                  :q_balance_transfer_intro_apr              ,
                  :balance_transfer_intro_apr_period         ,
                  :q_balance_transfer_intro_apr_period       ,
                  :balance_transfer_goto_rate                ,
                  :q_balance_transfer_goto_rate              ,
                  :cash_advance_goto_rate                    ,
                  :q_cash_advance_goto_rate                  ,
                  :penalty_goto_rate                         ,
                  :q_penalty_goto_rate                       ,
                  :late_fee                                  ,
                  :q_late_fee                                ,
                  :cash_advance_fee                          ,
                  :q_cash_advance_fee                        ,
                  :balance_transfer_fee                      ,
                  :q_balance_transfer_fee                    ,
                  :foreign_currency_exchange_fee             ,
                  :q_foreign_currency_exchange_fee           ,
                  :issuer                                   ,
                  :feature_flag                             ,
                  :popular_flag,
                  :low_apr_feature_flag,
                  :rewards_feature_flag, 
                  :business_feature_flag, 
                  :bad_credit_feature_flag, 
                  :student_feature_flag
  
  has_many :assignments, primary_key: :origin_id, foreign_key: :origin_id
  has_many :categories, through: :assignments
  
  validates :origin_id, presence: true

  # Refresh the data in the Product table
  def self.refresh_data!(source)
    require 'open-uri'
    # Delete all existing Product data
    Product.destroy_all
    
    # Determine if source is url or XML file
    if source =~ /^https?:\/\//
      doc = Nokogiri::XML(source)
    else
      f = File.open(source)
      doc = Nokogiri::XML(f)
      f.close
    end
    
    # Parse all products
    doc.xpath('data/products/product').each do |product|
      
      Product.create  last_updated:                     product.xpath('attribute::lastUpdated').inner_text.present? ? product.xpath('attribute::lastUpdated').inner_text.to_datetime : nil,
                      origin_id:                        product.xpath('id').inner_text,
                      name:                             product.xpath('name').inner_text,    
                      description:                      product.xpath('description').inner_text,
                      short_description:                product.xpath('shortDescription').inner_text,
                      image_path:                       product.xpath('imagePath').inner_text,
                      url:                              product.xpath('url').inner_text,
                      intro_apr:                        product.xpath('introApr').inner_text,
                      q_intro_apr:                      product.xpath('q_introApr').inner_text,
                      intro_apr_period:                 product.xpath('introAprPeriod').inner_text,
                      q_intro_apr_period:               product.xpath('q_introAprPeriod').inner_text,
                      regular_apr:                      product.xpath('regularApr').inner_text,
                      q_regular_apr:                    product.xpath('q_regularApr').inner_text,
                      annual_fee:                       product.xpath('annualFee').inner_text,
                      q_annual_fee:                     product.xpath('q_annualFee').inner_text,
                      credit_needed:                    product.xpath('creditNeeded').inner_text,
                      q_credit_needed:                  product.xpath('q_creditNeeded').inner_text,
                      balance_transfers:                product.xpath('balanceTransfers').inner_text,
                      q_balance_transfers:              product.xpath('q_balanceTransfers').inner_text,
                      transfer_fee_pin:                 product.xpath('transaction_fee_pin').inner_text,
                      q_transfer_fee_pin:               product.xpath('q_transaction_fee_pin').inner_text,
                      transaction_fee_signature:        product.xpath('transaction_fee_signature').inner_text,
                      q_transaction_fee_signature:      product.xpath('q_transaction_fee_signature').inner_text,
                      load_fee:                         product.xpath('load_fee').inner_text,
                      q_load_fee:                       product.xpath('q_load_fee').inner_text,
                      atm_fee:                          product.xpath('atm_fee').inner_text,
                      q_atm_fee:                        product.xpath('q_atm_fee').inner_text,
                      activation_fee:                   product.xpath('activation_fee').inner_text,
                      q_activation_fee:                 product.xpath('q_activation_fee').inner_text,
                      balance_transfer_intro_apr:       product.xpath('balanceTransferIntroApr').inner_text,
                      q_balance_transfer_intro_apr:     product.xpath('q_balanceTransferIntroApr').inner_text,
                      balance_transfer_intro_apr_period:   product.xpath('balanceTransferIntroAprPeriod').inner_text,
                      q_balance_transfer_intro_apr_period: product.xpath('q_balanceTransferIntroAprPeriod').inner_text,
                      balance_transfer_goto_rate:       product.xpath('balanceTransferGoToRate').inner_text,
                      q_balance_transfer_goto_rate:     product.xpath('q_balanceTransferGoToRate').inner_text,
                      cash_advance_goto_rate:           product.xpath('cashAdvanceGoToRate').inner_text,
                      q_cash_advance_goto_rate:         product.xpath('q_cashAdvanceGoToRate').inner_text,
                      penalty_goto_rate:                product.xpath('penaltyGoToRate').inner_text,
                      q_penalty_goto_rate:              product.xpath('q_penaltyGoToRate').inner_text,
                      late_fee:                         product.xpath('lateFee').inner_text,
                      q_late_fee:                       product.xpath('q_lateFee').inner_text,
                      cash_advance_fee:                 product.xpath('cashAdvanceFee').inner_text,
                      q_cash_advance_fee:               product.xpath('q_cashAdvanceFee').inner_text,
                      balance_transfer_fee:             product.xpath('balanceTransferFee').inner_text,
                      q_balance_transfer_fee:           product.xpath('q_balanceTransferFee').inner_text,
                      foreign_currency_exchange_fee:    product.xpath('foreignCurrencyExchangeFee').inner_text,
                      q_foreign_currency_exchange_fee:  product.xpath('q_foreignCurrencyExchangeFee').inner_text,
                      issuer:                           product.xpath('issuer').inner_text
    end 
  end   
        
end     
        
        