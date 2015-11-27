class Admin::SubscriptionsController < DashboardController
  def index
    @subscriptions = Subscription.all
    respond_to do |format|
      format.html
      format.csv { send_data @subscriptions.to_csv, filename: "subscriptions-#{Date.today}.csv" }
    end
  end

  def export
    @subscriptions = Subscription.all
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    flash[:notice] = "Subscription has been deleted."
    redirect_to admin_subscriptions_path
  end
end
