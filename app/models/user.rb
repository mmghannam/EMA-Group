class User < ActiveRecord::Base
  has_one :cart
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum position: [ :admin , :client]

  validates_presence_of :name,:address,:mobile_number,:workplace
end
