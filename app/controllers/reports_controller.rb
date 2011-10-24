class ReportsController < ApplicationController

  def index
    @reports = Report.recent(14)
  end
  
  def new
    @report = Report.new
  end
  
end