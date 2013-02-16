module AWSSNSSubscription
  module Confirmer
    extend ActiveSupport::Concern

    def respond_to_aws_sns_subscription_confirmations
      if request.headers["x-amz-sns-message-type"] == "SubscriptionConfirmation"
        HTTParty.get JSON.parse(request.raw_post)["SubscribeURL"]
        head :ok and return
      end
    end
  end
end