class ContactsController < ApplicationController
  before_filter :parse_dates, :only => [:create, :update]

  def index
    @contacts = Contact.recent(25).includes(:addresses, :gender, :race)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(params[:contact])

    if @contact.save
      redirect_to contacts_url, :notice => "Contact '#{@contact.full_name}' was successfully created."
    else
     render :action => "new"
    end
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update_attributes(params[:contact])
      redirect_to contacts_url, :notice => "Contact '#{@contact.full_name}' was successfully updated."
    else
      render :action => "edit"
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    redirect_to contacts_url
  end

  private

  # Convert these dates from human readable to real dates/timestamps
  def parse_dates
    params[:contact][:dob] = Chronic.parse(params[:contact][:dob]).to_s if params[:contact][:dob]
    params[:contact][:incident_timestamp] = Chronic.parse(params[:contact][:incident_timestamp]).to_s if params[:contact][:incident_timestamp]
  end
end
