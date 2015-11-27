class SubscriptionsController < ApplicationController
 def create
   @subscription = Subscription.new(subscription_params)
   if @subscription.save
     cookies[:saved_subscription] = true
     redirect_to subscribe_path
   else
     redirect_to subscribe_path, alert: "Failed to save"
   end
 end

 private

 def subscription_params
   params.require(:subscription).permit(:email)
 end
end
