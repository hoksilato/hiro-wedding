ActiveAdmin.register Group do
  menu priority: 2
  permit_params :name, :note
end
