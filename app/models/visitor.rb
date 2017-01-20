# == Schema Information
#
# Table name: visitors
#
#  id         :integer          not null, primary key
#  code       :string
#  name       :string
#  group_id   :integer
#  num        :integer
#  table      :integer
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Visitor < ApplicationRecord
  belongs_to :group
end
