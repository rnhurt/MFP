class ReportsController < ApplicationController

  def index
    @reports = {}# = Report.recent(14).search(params[:search])
  end
  
  def new
    @report = Report.new
  end
  
end