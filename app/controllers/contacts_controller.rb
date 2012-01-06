class ContactsController < ApplicationController
  def index
    @contacts = Contact.recent.search(params[:search])
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
    @contact.addresses.build
  end

  def edit
    @contact = Contact.find(params[:id])
    # @contact.addresses.create(:postal_code => "12345")
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
