class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      flash[:notice] = "Obrigado pela mensagem :)"
      redirect_to new_contact_path
    else
      flash[:error] = "Todos os campos são de preenchimento obrigatório."
      render :action => :new
    end
  end
  
end
