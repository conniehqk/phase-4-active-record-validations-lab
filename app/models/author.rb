class Author < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :phone_number, length: { is: 10 }

    def create
        person = Author.create(person_params)
        if person.valid?
          render json: person, status: :created
        else
          render json: { error: person.errors.full_messages }, status: :unprocessable_entity
        end
      end

end



