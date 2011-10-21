class AddressesController < ApplicationController
  before_filter :parse_dates, :only => [:create, :update]

  def index
    @addresses = Address.recent(params[:limit] || 5).search(params[:search])
  end

  def show
    @address = Address.find(params[:id])
  end

  def new
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(params[:address])

    if @address.save
      redirect_to addresss_url, :notice => "Address '#{@address}' was successfully created."
    else
     render :action => "new"
    end
  end

  def update
    @address = Address.find(params[:id])

    if @address.update_attributes(params[:address])
      redirect_to addresss_url, :notice => "Address '#{@address}' was successfully updated."
    else
      render :action => "edit"
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy

    redirect_to addresss_url
  end

  private

  # Convert these dates from human readable to real dates/timestamps
  def parse_dates
    params[:address][:dob] = Chronic.parse(params[:address][:dob]).to_s if params[:address][:dob]
    params[:address][:incident_timestamp] = Chronic.parse(params[:address][:incident_timestamp]).to_s if params[:address][:incident_timestamp]
  end
end
