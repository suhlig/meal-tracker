class DomainValidator < ActiveModel::Validator
  def validate(user)
    unless user.email.ends_with?("@familie-uhlig.net")
      user.errors.add :base, "Adresse gehört nicht zu einer der erlaubten Domains."
    end
  end
end
