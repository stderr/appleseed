require 'json'

module Appleseed
  module Seeding
    def self.seed_with(template)
      template.generate do |t|
        if t.class.custom_request?
          client = Appleseed::Api::Client.new
          response = client.post(t.endpoint, t.seed_data.to_json)
          canvas_id = JSON.parse(response.body)[:id]
        else
          canvas_id = Appleseed.client.send(t.class.create_method, *t.scoped_attrs, t.seed_data).id
          t.canvas_id = canvas_id
        end

        cache_key = t.class.name.demodulize.underscore
        unless Appleseed.cache.has_key? cache_key
          Appleseed.cache[cache_key] = []
        end
        Appleseed.cache[cache_key] << t.canvas_id
      end
    end

  end
end
