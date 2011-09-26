module Harvest
  module API
    class Invoices < Base
      api_model Harvest::Invoice
      include Harvest::Behavior::Crud
      
      def outstanding_at_page(page = 1, user = nil)
        path = api_model.api_path + '?status=draft&page=' + page.to_s
        response = request(:get, credentials, path, :query => of_user_query(user))

        return api_model.parse(response.parsed_response)
      end

      def create(*)
        raise "Creating and updating invoices are not implemented due to API issues"
      end
      
      def update(*)
        raise "Creating and updating invoices are not implemented due to API issues"
      end
    end
  end
end
