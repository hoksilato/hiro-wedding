ActiveAdmin.register Visitor do
  menu priority: 1
  permit_params :name, :code, :group_id, :num, :table, :note

  scope :all
  scope :confirmed
  scope :unconfirmed
  scope :assinged_table
  scope :not_assigned_table

  active_admin_import validate: true,
                      back: {action: :index},
                      template: 'import' ,
                      template_object: ActiveAdminImport::Model.new(
                        hint: "You can configure CSV options below and can download the template <a href='/visitors.csv' target='_blank'>here</a>!",
                        csv_options: { col_sep: ",", row_sep: nil, quote_char: nil },
                        force_encoding: :auto # automatically detect file encoding
                      ),
                      headers_rewrites: { :'Group name' => :group_id },
                      before_batch_import: ->(importer) {
                        # before each bulk insert we're deleting records with the same ids ~ update by id
                        Visitor.where(id: importer.values_at('id')).delete_all
                        groups_names = importer.values_at(:group_id)
                        # replacing group name with group id
                        groups = Group.where(name: groups_names).pluck(:name, :id)
                        options = Hash[*groups.flatten] # #{"Friend" => 2, "Family" => 1}
                        importer.batch_replace(:group_id, options)
                      }
end
