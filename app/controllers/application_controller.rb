class ApplicationController < ActionController::Base
  # before_filter CASClient::Frameworks::Rails::Filter
  # Authenticate with CAS
  before_action :cas_filter, except: ['logout']
  before_action :authorized, except: ['logout','unauthorized']
  include Pundit
  helper_method :current_user
  helper_method :department_url
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :exception

  def logout
    reset_session
    RubyCAS::Filter.logout(self)
  end

  def current_user
    @current_user = Person.find_by_net_id(session[:cas_user])
  end

  def authorized
    redirect_to '/unauthorized' if !current_user
  end

  def department_url
    d = Department.find(current_user.roles.where(name: :department_admin).map(&:resource_id)).first
    c = d.college
    college_department_path c, d
  end

  private
  # Prompts user to log in via CAS
  def cas_filter
    unless Rails.env.test?
      RubyCAS::Filter.filter self
    end
  end
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
