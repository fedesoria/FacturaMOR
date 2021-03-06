# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 7) do

  create_table "accounts", :force => true do |t|
    t.column "owner_id",         :integer
    t.column "short_name",       :string,                                      :null => false
    t.column "blocked",          :boolean,                  :default => false, :null => false
    t.column "name",             :string,                                      :null => false
    t.column "name_for_sorting", :string
    t.column "bank_account",     :string
    t.column "direct_login",     :boolean,                  :default => false
    t.column "referer",          :string,   :limit => 1024
    t.column "landing_page",     :string,   :limit => 1024
    t.column "created_at",       :datetime
    t.column "updated_at",       :datetime
  end

  create_table "addresses", :force => true do |t|
    t.column "street1",          :string
    t.column "street2",          :string
    t.column "city",             :string
    t.column "province",         :string
    t.column "postal_code",      :string
    t.column "country_id",       :integer
    t.column "addressable_id",   :integer
    t.column "addressable_type", :string
  end

  add_index "addresses", ["country_id"], :name => "country_id"

  create_table "chpass_tokens", :force => true do |t|
    t.column "token",      :string,   :null => false
    t.column "account_id", :integer
    t.column "created_at", :datetime
  end

  add_index "chpass_tokens", ["account_id"], :name => "account_id"
  add_index "chpass_tokens", ["token"], :name => "index_chpass_tokens_on_token"

  create_table "countries", :force => true do |t|
    t.column "name",             :string
    t.column "name_for_sorting", :string
  end

  create_table "customers", :force => true do |t|
    t.column "url_id",           :string,                                  :null => false
    t.column "account_id",       :integer,                                 :null => false
    t.column "name",             :string
    t.column "name_for_sorting", :string
    t.column "cif",              :string,                                  :null => false
    t.column "discount_percent", :decimal,  :precision => 10, :scale => 2
    t.column "notes",            :text
    t.column "created_at",       :datetime
    t.column "updated_at",       :datetime
  end

  add_index "customers", ["account_id"], :name => "account_id"
  add_index "customers", ["url_id"], :name => "index_customers_on_url_id"

  create_table "db_files", :force => true do |t|
    t.column "data", :binary
  end

  create_table "fiscal_datas", :force => true do |t|
    t.column "account_id",       :integer,                                :null => false
    t.column "name",             :string,                                 :null => false
    t.column "name_for_sorting", :string
    t.column "cif",              :string,                                 :null => false
    t.column "iva_percent",      :decimal, :precision => 10, :scale => 2
    t.column "invoice_footer",   :text
    t.column "irpf_percent",     :decimal, :precision => 10, :scale => 2
    t.column "charges_irpf",     :boolean
    t.column "logo_id",          :integer
  end

  add_index "fiscal_datas", ["account_id"], :name => "account_id"
  add_index "fiscal_datas", ["logo_id"], :name => "logo_id"

  create_table "invoice_lines", :force => true do |t|
    t.column "invoice_id",              :integer,                                                :null => false
    t.column "amount",                  :decimal,                 :precision => 10, :scale => 2
    t.column "description",             :string,  :limit => 1024
    t.column "price",                   :decimal,                 :precision => 10, :scale => 2
    t.column "total",                   :decimal,                 :precision => 10, :scale => 2
    t.column "description_for_sorting", :string,  :limit => 1024
  end

  add_index "invoice_lines", ["invoice_id"], :name => "invoice_id"

  create_table "invoice_pdfs", :force => true do |t|
    t.column "invoice_id", :integer, :null => false
    t.column "data",       :binary,  :null => false
  end

  add_index "invoice_pdfs", ["invoice_id"], :name => "invoice_id"

  create_table "invoices", :force => true do |t|
    t.column "url_id",                :string,                                                     :null => false
    t.column "account_id",            :integer,                                                    :null => false
    t.column "customer_id",           :integer,                                                    :null => false
    t.column "number",                :string,                                                     :null => false
    t.column "date",                  :date
    t.column "year",                  :integer
    t.column "account_name",          :string,                                                     :null => false
    t.column "account_cif",           :string,                                                     :null => false
    t.column "account_street1",       :string
    t.column "account_street2",       :string
    t.column "account_city",          :string
    t.column "account_province",      :string
    t.column "account_postal_code",   :string
    t.column "account_country_id",    :integer
    t.column "account_country_name",  :string
    t.column "customer_name",         :string,                                                     :null => false
    t.column "customer_cif",          :string,                                                     :null => false
    t.column "customer_street1",      :string
    t.column "customer_street2",      :string
    t.column "customer_city",         :string
    t.column "customer_province",     :string
    t.column "customer_postal_code",  :string
    t.column "customer_country_id",   :integer
    t.column "customer_country_name", :string
    t.column "irpf_percent",          :decimal,  :precision => 10, :scale => 2
    t.column "irpf",                  :decimal,  :precision => 10, :scale => 2
    t.column "iva_percent",           :decimal,  :precision => 10, :scale => 2
    t.column "iva",                   :decimal,  :precision => 10, :scale => 2
    t.column "discount_percent",      :decimal,  :precision => 10, :scale => 2
    t.column "discount",              :decimal,  :precision => 10, :scale => 2
    t.column "total",                 :decimal,  :precision => 10, :scale => 2
    t.column "paid",                  :boolean,                                 :default => false, :null => false
    t.column "notes",                 :text
    t.column "footer",                :text
    t.column "logo_id",               :integer
    t.column "created_at",            :datetime
    t.column "updated_at",            :datetime
    t.column "tax_base",              :decimal,  :precision => 10, :scale => 2
  end

  add_index "invoices", ["account_id"], :name => "account_id"
  add_index "invoices", ["customer_id"], :name => "customer_id"
  add_index "invoices", ["account_country_id"], :name => "account_country_id"
  add_index "invoices", ["customer_country_id"], :name => "customer_country_id"
  add_index "invoices", ["logo_id"], :name => "logo_id"
  add_index "invoices", ["url_id"], :name => "index_invoices_on_url_id"

  create_table "login_tokens", :force => true do |t|
    t.column "type",        :string
    t.column "token",       :string,   :null => false
    t.column "account_id",  :integer
    t.column "customer_id", :integer
    t.column "created_at",  :datetime
    t.column "updated_at",  :datetime
  end

  add_index "login_tokens", ["account_id"], :name => "account_id"
  add_index "login_tokens", ["customer_id"], :name => "customer_id"
  add_index "login_tokens", ["token"], :name => "index_login_tokens_on_token"

  create_table "logos", :force => true do |t|
    t.column "parent_id",    :integer
    t.column "content_type", :string
    t.column "filename",     :string
    t.column "db_file_id",   :integer
    t.column "thumbnail",    :string
    t.column "size",         :integer
    t.column "width",        :integer
    t.column "height",       :integer
  end

  add_index "logos", ["parent_id"], :name => "parent_id"
  add_index "logos", ["db_file_id"], :name => "db_file_id"

  create_table "sessions", :force => true do |t|
    t.column "session_id", :string
    t.column "data",       :text
    t.column "updated_at", :datetime
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.column "account_id",                :integer,                                   :null => false
    t.column "first_name",                :string
    t.column "first_name_for_sorting",    :string
    t.column "last_name",                 :string
    t.column "last_name_for_sorting",     :string
    t.column "created_at",                :datetime
    t.column "updated_at",                :datetime
    t.column "email",                     :string
    t.column "crypted_password",          :string,   :limit => 40
    t.column "salt",                      :string,   :limit => 40
    t.column "remember_token",            :string
    t.column "remember_token_expires_at", :datetime
    t.column "activation_code",           :string,   :limit => 40
    t.column "activated_at",              :datetime
    t.column "is_blocked",                :boolean,                :default => false
    t.column "last_seen_at",              :datetime
  end

  add_index "users", ["account_id"], :name => "account_id"

  add_foreign_key "addresses", ["country_id"], "countries", ["id"]

  add_foreign_key "chpass_tokens", ["account_id"], "accounts", ["id"]

  add_foreign_key "customers", ["account_id"], "accounts", ["id"]

  add_foreign_key "fiscal_datas", ["account_id"], "accounts", ["id"]
  add_foreign_key "fiscal_datas", ["logo_id"], "logos", ["id"]

  add_foreign_key "invoice_lines", ["invoice_id"], "invoices", ["id"]

  add_foreign_key "invoice_pdfs", ["invoice_id"], "invoices", ["id"]

  add_foreign_key "invoices", ["account_id"], "accounts", ["id"]
  add_foreign_key "invoices", ["customer_id"], "customers", ["id"]
  add_foreign_key "invoices", ["account_country_id"], "countries", ["id"]
  add_foreign_key "invoices", ["customer_country_id"], "countries", ["id"]
  add_foreign_key "invoices", ["logo_id"], "logos", ["id"]

  add_foreign_key "login_tokens", ["account_id"], "accounts", ["id"]
  add_foreign_key "login_tokens", ["customer_id"], "customers", ["id"]

  add_foreign_key "logos", ["parent_id"], "logos", ["id"]
  add_foreign_key "logos", ["db_file_id"], "db_files", ["id"]

  add_foreign_key "users", ["account_id"], "accounts", ["id"]

end
