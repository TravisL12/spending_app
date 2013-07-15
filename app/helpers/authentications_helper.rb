module AuthenticationsHelper

  def find_user(auth, user)
    if auth['provider'] == 'facebook' && User.find_by_email(auth['info']['email'])
      standard_user = User.find_by_email(auth['info']['email'])
      user.update_attributes(:user_id => standard_user.id, :email => auth['info']['email'])
      standard_user
    else
      user
    end
  end


  def create_user(auth)
    #create User.new when using authentication login
  end

end
