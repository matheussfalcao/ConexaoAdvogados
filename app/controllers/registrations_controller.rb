class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    if resource.save
      # Send confirmation instructions using Devise method
      resource.send_confirmation_instructions

      redirect_to pending_confirmation_path
    else
      Rails.logger.debug { "User creation failed: #{resource.errors.full_messages.join(", ")}" }
      clean_up_passwords(resource)
      set_minimum_password_length
      render :new
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(
      :name, :lastname, :cpf, :oab, :sex, :birth_date,
      :city, :state, :phone, :email, :password, :password_confirmation,
      :terms_of_use
    )
  end
end
