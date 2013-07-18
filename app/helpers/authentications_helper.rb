module AuthenticationsHelper

  def find_user(auth, user)
      standard_user = User.find_by_email(auth['info']['email'])
      user.update_attributes(:user_id => standard_user.id, :email => auth['info']['email'])
      standard_user
  end

  def create_user(auth, user)
    first_name      = auth['info']['first_name']
    last_name       = auth['info']['last_name']
    username        = auth['info']['nickname']
    email           = auth['info']['email']

    @user = User.create(:first_name => first_name,
      :last_name => last_name,
      :username => username,
      :email => email,
      :password => 'password')

    user.update_attributes(:user_id => @user.id, :email => email)
    @user
  end
end
