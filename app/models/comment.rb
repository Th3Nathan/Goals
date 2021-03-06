# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  body             :string           not null
#  created_at       :datetime
#  updated_at       :datetime
#  commentable_id   :integer
#  commentable_type :string
#

class Comment < ActiveRecord::Base
    validates :user_id, :body, presence: true 
    belongs_to :commentable, polymorphic: true 
end
    
