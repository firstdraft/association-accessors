class Associations::StepsController < ApplicationController
  include Wicked::Wizard

  steps *Association.form_steps

  def show
  end

  def update
  end
end
