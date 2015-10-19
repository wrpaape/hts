module AddDescription
  extend ActiveSupport::Concern

  included do
    class_attribute :desc_lambda

    before_create :set_description

    private

    def set_description
      self.description = parent.instance_exec(&desc_lambda)
    end
  end
end