module Appleseed
  module Seeding
    def self.seed_with(template)
      template.process do |t|
        # Pandarus funkiness on the Enrollment api requires this.
        # Needs refactoring
        if t.scoped_id.is_a?(Array)
          json = Appleseed.client.send(t.class.create_method, *t.scoped_id, t.seed_data)
        else
          json = Appleseed.client.send(t.class.create_method, t.scoped_id, t.seed_data)
        end
        # yea, I know.
        t.canvas_id = json.id
      end
    end
  end
end
