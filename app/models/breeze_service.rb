class BreezeService
  include HTTParty
  base_uri 'https://ntnc.breezechms.com/api'
  debug_output $STDOUT
  headers 'Api-Key' => ENV['BREEZE_KEY']
  format :json

  def add_contribution(data)
    response = self.class.get(
      "/giving/add",
      query: {
        date: data[:date],
        person_json: data[:person].to_json,
        uid: data[:uid],
        processor: 'Stripe',
        method: 'Credit/Debit Online',
        funds_json: [data[:fund]].to_json,
        amount: data[:amount],
        note: data[:note],
        batch_number: "720"
      }
    )

    return response
  end

end
