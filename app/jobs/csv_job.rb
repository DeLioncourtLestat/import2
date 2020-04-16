

class CsvJob

  def export
    data_acces = DataAccess.all.first
    pipedrive = Pipedrive.new(data_acces)
    users = pipedrive.load_users
    puts users

    persons = pipedrive.load_persons
    puts persons
  end

end