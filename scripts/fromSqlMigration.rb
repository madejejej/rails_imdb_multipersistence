Neoid.batch do
  [ ActedIn.includes(:actor).includes(:movie), OtherRelationshipModel.includes(:from_model).includes(:to_model) ].each { |model| model.all.each(&:neo_save) }
  [ ActedIn.includes(:actor).includes(:series), OtherRelationshipModel.includes(:from_model).includes(:to_model) ].each { |model| model.all.each(&:neo_save) }

  NodeModel.all.each(&:neo_save)
end
