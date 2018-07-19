class BreezeService
  include HTTParty
  base_uri 'https://ntnc.breezechms.com/api'
  debug_output $STDOUT
  headers 'Api-Key' => ENV['BREEZE_KEY']
  format :json

  def add_contribution(data, registration)
    response = self.class.get(
      "/giving/add",
      query: {
        date: data[:date],
        person_json: data[:person].to_json,
        uid: registration.id,
        processor: 'Stripe',
        method: 'Credit/Debit Online',
        funds_json: [data[:fund]].to_json,
        amount: data[:amount],
        note: data[:note],
        batch_number: "720"
      }
    )

    if response['success']
      return registration.update(breeze_payment_id: response['payment_id'])
    else
      return response['errors']
    end
  end

end
