class AddDonationAmountToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :donation_amount, :float
  end
end
