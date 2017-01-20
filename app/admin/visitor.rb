ActiveAdmin.register Visitor do
  permit_params :name, :code, :group_id, :num, :table, :note

  scope :all
  scope :confirmed
  scope :unconfirmed
  scope :assinged_table
  scope :not_assigned_table
end
