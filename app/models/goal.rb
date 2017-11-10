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
#


class Goal < ActiveRecord::Base
    validates :title, :finished, presence: true 
    has_many :comments, as: :commentable
    belongs_to :user

    def finished 
        self.finished = false 
    end 
end
