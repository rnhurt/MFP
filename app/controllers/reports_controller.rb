class ReportsController < ApplicationController
  def index
    @type_counts = Contact.type_counts
  end

  def show
    case params[:id]
      when "recent_contacts"
        @contacts = Contact.recent(params[:q])
        render "recent_contacts"
      else
        redirect_to reports_url, :flash => { :warning => "Report not found" }
    end
  end

end
