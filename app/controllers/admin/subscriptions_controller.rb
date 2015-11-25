class Admin::SubscriptionsController < DashboardController
  def index
    @subscriptions = Subscription.all
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    flash[:notice] = "Subscription has been deleted."
    redirect_to admin_subscriptions_path
  end
end
