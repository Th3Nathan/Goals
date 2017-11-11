# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  details    :string
#  finished   :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

require 'rails_helper'

RSpec.describe Goal, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
