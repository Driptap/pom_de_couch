class FacebookRegistrationService
  #attr_reader :user

  def initialize(auth)
    @auth = auth
  end
  # Calls the create user method
  def register!
    ActiveRecord::Base.transaction do
      update_user!
    end
  end
  # Gets the auth token from facebook user the callback code
  def connect!
    return @auth.credentials.token
  end
  # Finds exisiting Facebook graph user or creates a new one
  def user
    @user = User.find_or_initialize_by(fb_uid: @auth.uid)
    return @user
  end
  private
  # Updates the attributes of the user with facebook data
  def update_user!
    user.update(user_attributes)
  end
  # User facebook attributes params
  def user_attributes
    {
      name:             @auth.info.first_name.presence || @auth.extra.raw_info.first_name + " " + @auth.info.last_name.presence || @auth.extra.raw_info.last_name,
      fb_token:          @auth.credentials.token,
      fb_profile_picture:    @auth.info.image.presence || @auth.extra.raw_info.image
    }
  end
end