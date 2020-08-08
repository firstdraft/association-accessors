class BuildAssociationController < ApplicationController
  include Wicked::Wizard

  steps :origin_model, :terminus_model, :nature

  def show
    @user = current_user
    case step
    when :origin_model
      @stuff = "origin_model"
    when :terminus_model
      @stuff = "terminus_model"
    when :nature
      @stuff = "nature"
     
    end
    render_wizard
  end
end
