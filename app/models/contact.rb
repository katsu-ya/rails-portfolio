class Contact
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :name, :string
    attribute :email, :string

    validates :name, presence: true
    validates :email, presence: true
end
