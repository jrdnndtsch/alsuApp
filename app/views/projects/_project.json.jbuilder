json.extract! project, :id, :name, :slogan, :description, :approved, :user_id, :created_at, :updated_at
json.url project_url(project, format: :json)