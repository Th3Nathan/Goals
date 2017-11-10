# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string           not null
#  session_token   :string           not null
#

FactoryBot.define do
  factory :user do
    
  end
end
