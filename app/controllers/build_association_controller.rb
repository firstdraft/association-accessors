class BuildAssociationController < ApplicationController
  include Wicked::Wizard

  steps :confirm_password, :confirm_profile, :find_friends

  def show
    @user = current_user
    case step
    when :find_friends
      @friends = @user.find_friends
    end
    render_wizard
  end
end
