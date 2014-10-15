module Appleseed
  module Seeding
    def self.seed_with(template)
      template.generate do |t|
        json = Appleseed.client.send(t.class.create_method, *t.scoped_attrs, t.seed_data)
        t.canvas_id = json.id
      end
    end
  end
end
