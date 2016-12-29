class UsersController < Clearance::UsersController

  def new
    @user = User.new
  end

  def create
    @user = user_from_params
    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])

  end

  private

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    fullname = user_params.delete(:fullname)

    #image_url = user_params.delete(:image_url)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.fullname = fullname


      # user.image_url = image_url
    end
  end

  def user_params
    params[Clearance.configuration.user_parameter] || Hash.new
  end

end
