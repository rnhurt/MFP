class ContactsController < ApplicationController
  def index
    # @contacts = Contact.recent(25).includes(:addresses, :gender, :race, :locations).search(params[:search])
    @contacts = Contact.recent(5).search(params[:search])
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

end
