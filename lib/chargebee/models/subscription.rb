module ChargeBee
  class Subscription < Model

    class Addon < Model
      attr_accessor :id, :quantity, :unit_price
    end

    class Coupon < Model
      attr_accessor :coupon_id, :apply_till, :applied_count, :coupon_code
    end

    class ShippingAddress < Model
      attr_accessor :first_name, :last_name, :email, :company, :phone, :line1, :line2, :line3, :city, :state_code, :state, :country, :zip, :validation_status
    end

  attr_accessor :id, :customer_id, :currency_code, :plan_id, :plan_quantity, :plan_unit_price,
  :setup_fee, :billing_period, :billing_period_unit, :plan_free_quantity, :status, :start_date,
  :trial_start, :trial_end, :current_term_start, :current_term_end, :next_billing_at, :remaining_billing_cycles,
  :po_number, :created_at, :started_at, :activated_at, :cancelled_at, :cancel_reason, :affiliate_token,
  :created_from_ip, :resource_version, :updated_at, :has_scheduled_changes, :due_invoices_count,
  :due_since, :total_dues, :mrr, :exchange_rate, :base_currency_code, :addons, :coupon, :coupons,
  :shipping_address, :invoice_notes, :meta_data, :deleted

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    Request.send('post', uri_path("subscriptions"), params, env, headers)
  end

  def self.create_for_customer(id, params, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"subscriptions"), params, env, headers)
  end

  def self.list(params={}, env=nil, headers={})
    Request.send_list_request('get', uri_path("subscriptions"), params, env, headers)
  end

  def self.subscriptions_for_customer(id, params={}, env=nil, headers={})
    Request.send('get', uri_path("customers",id.to_s,"subscriptions"), params, env, headers)
  end

  def self.retrieve(id, env=nil, headers={})
    Request.send('get', uri_path("subscriptions",id.to_s), {}, env, headers)
  end

  def self.retrieve_with_scheduled_changes(id, env=nil, headers={})
    Request.send('get', uri_path("subscriptions",id.to_s,"retrieve_with_scheduled_changes"), {}, env, headers)
  end

  def self.remove_scheduled_changes(id, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"remove_scheduled_changes"), {}, env, headers)
  end

  def self.remove_scheduled_cancellation(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"remove_scheduled_cancellation"), params, env, headers)
  end

  def self.remove_coupons(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"remove_coupons"), params, env, headers)
  end

  def self.update(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s), params, env, headers)
  end

  def self.change_term_end(id, params, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"change_term_end"), params, env, headers)
  end

  def self.cancel(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"cancel"), params, env, headers)
  end

  def self.reactivate(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"reactivate"), params, env, headers)
  end

  def self.add_charge_at_term_end(id, params, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"add_charge_at_term_end"), params, env, headers)
  end

  def self.charge_addon_at_term_end(id, params, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"charge_addon_at_term_end"), params, env, headers)
  end

  def self.charge_future_renewals(id, params={}, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"charge_future_renewals"), params, env, headers)
  end

  def self.import_subscription(params, env=nil, headers={})
    Request.send('post', uri_path("subscriptions","import_subscription"), params, env, headers)
  end

  def self.import_for_customer(id, params, env=nil, headers={})
    Request.send('post', uri_path("customers",id.to_s,"import_subscription"), params, env, headers)
  end

  def self.delete(id, env=nil, headers={})
    Request.send('post', uri_path("subscriptions",id.to_s,"delete"), {}, env, headers)
  end

  end # ~Subscription
end # ~ChargeBee