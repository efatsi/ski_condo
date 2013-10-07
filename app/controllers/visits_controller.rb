class VisitsController < ApplicationController

  def create
    if !day.already_has?(current_user)
      day.visits.create!(:user => current_user)
      flash[:notice] = "Success! You're all signed up for that day."
    else
      flash[:error] = "Looks like you're already signed up for that day."
    end

    redirect_to :back
  end

  def destroy
    visit = Visit.find(params[:id])
    visit.destroy

    redirect_to :back, :notice => "No longer signed up for that day."
  end

  private

  def day
    @day ||= Day.find(params[:id])
  end

end
