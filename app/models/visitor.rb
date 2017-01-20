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

  validates :code, presence: true
  validates :name, presence: true
  validates :group, presence: true

  scope :confirmed, ->{ where.not(num: nil) }
  scope :unconfirmed, ->{ where(num: nil) }
  scope :assinged_table, ->{ where.not(table: nil).where.not(num: nil) }
  scope :not_assigned_table, ->{ where(table: nil).where.not(num: nil) }
end
