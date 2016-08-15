class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  
  has_secure_password
  
  def mood
    if happiness.nil? || nausea.nil?
      5
    else
      happiness > nausea ? 'happy' : 'sad'
    end
  end
end
