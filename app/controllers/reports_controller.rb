class ReportsController < ApplicationController

  def show
    case params[:id]
      when "recent_contacts"
        @contacts = Contact.recent(10)
        render "recent_contacts"
      else
        redirect_to reports_url, :flash => { :warning => "Report not found" }
    end
  end

end
