module Appleseed
  module Seeding
    def self.seed_with(template)
      template.generate do |t|
        json = Appleseed.client.send(t.class.create_method, *t.scoped_attrs, t.seed_data)
        t.canvas_id = json.id

        cache_key = t.class.name.demodulize.underscore
        unless Appleseed.cache.has_key? cache_key
          Appleseed.cache[cache_key] = []
        end
        Appleseed.cache[cache_key] << t.canvas_id
      end
    end
  end
end
