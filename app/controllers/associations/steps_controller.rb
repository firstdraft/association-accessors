class Associations::StepsController < ApplicationController
  include Wicked::Wizard

  steps *Association.form_steps

  def show
    @association = Association.find(params[:association_id])
    render_wizard
  end

  def update
  end
end
