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

require 'rails_helper'

RSpec.describe Visitor, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
