module Appleseed
  module Seeding
    def self.seed_with(template)
      template.process do |t|
        # Pandarus funkiness on the Enrollment api requires this.
        # Needs refactoring
        json = Appleseed.client.send(t.class.create_method, *t.scoped_attrs, t.seed_data)
        # yea, I know.
        t.canvas_id = json.id
      end
    end
  end
end
