class AddDetailsToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :quantity, :integer
    add_column :transactions, :return_details, :boolean
    add_column :transactions, :expired_date, :datetime
    add_column :transactions, :return_date, :datetime
  end
end
