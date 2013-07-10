class RegularUser < User

	has_secure_password

	validates :username, :uniqueness => true
	validates :email,
	:format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
	:on => :create }
	validates :password, :presence => true, :on => :create

end