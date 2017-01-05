json.extract! person, :id, :name, :first_name, :second_name, :last_name, :cellphone, :inn, :created_at, :updated_at
json.url person_url(person, format: :json)