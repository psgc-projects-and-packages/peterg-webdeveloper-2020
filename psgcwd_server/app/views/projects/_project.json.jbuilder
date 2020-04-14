json.extract! project, :id, :guid, :slug, :ptitle, :psubtitle, :body, :client, :startdate_id, :enddate_id, :created_at, :updated_at
json.url project_url(project, format: :json)
