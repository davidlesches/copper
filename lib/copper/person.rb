module Copper
  class Person < BaseEntity

    attr_accessor :address,
                  :company_id,
                  :company_name,
                  :contact_type_id,
                  :date_last_contacted,
                  :interaction_count,
                  :title,

                  :emails,
                  :phone_numbers,
                  :socials,
                  :websites,

                  :prefix,
                  :first_name,
                  :middle_name,
                  :last_name,
                  :suffix

    def self.api_name
      "people"
    end

    def self.find_by_email(email)
      uri = get_uri(api_name, 'fetch_by_email')

      response = send_request("post", uri, email: email)
      handle_response(new, response)
    end

    def self.relate_to_company(person_id, company_id)
      url = client.base_url + "#{api_name}" + "/#{person_id}/related"
      uri = URI.parse(url)

      attributes = { resource: { type: 'company', id: company_id } }
      response   = send_request("post", uri, attributes)

      handle_response(self.new, response)
    end

  end
end
