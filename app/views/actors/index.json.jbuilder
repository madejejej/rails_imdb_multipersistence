json.array!(@actors) do |actor|
  json.extract! actor, :id, :idactors, :lname, :fname, :mname, :gender, :number
  json.url actor_url(actor, format: :json)
end
