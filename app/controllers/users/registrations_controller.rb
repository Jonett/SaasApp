class Users::RegistrationsController < Devise::RegistrationsController
  # Extend default Devise gem behavior so that 
  # users signing up with the Pro account (plan ID 2)
  # save with a special Stribe subscription function
  # otherwise Devise signs up user as usual.
  def create
    super do |resrouce|
      if params[:plan]
        resrouce.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_subscription
        else
          resource.save
        end
      end
    end
  end
end