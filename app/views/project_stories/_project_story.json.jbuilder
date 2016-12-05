json.extract! project_story, :id, :media_type, :description, :video_link, :project_id, :created_at, :updated_at
json.url project_story_url(project_story, format: :json)