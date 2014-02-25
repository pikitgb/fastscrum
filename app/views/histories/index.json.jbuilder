json.array!(@histories) do |history|
  json.extract! history, :id, :name, :puntuation, :finished_definition, :comments
  json.url history_url(history, format: :json)
end
