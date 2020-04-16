require "csv"

class CsvJob

  def export
    data_acces = DataAccess.all.first
    pipedrive = Pipedrive.new(data_acces)
    # Массив с пользователями
    users = pipedrive.load_users
    # Экспортируем массив в CSV
    export_csv(users, "users")
    persons = pipedrive.load_persons
    export_csv(persons, "persons")
    organizations = pipedrive.load_organizations
    export_csv(organizations, "organizations")
    activities = pipedrive.load_activities
    export_csv(activities, "activities")
    сurrencies = pipedrive.load_persons
    export_csv(сurrencies, "сurrencies")
  end

  # Метод для экспорта в CSV
  def export_csv(array, name_csv)
    CSV.open(name_csv + ".csv", "wb") do |csv|
      csv << array.first.keys # adds the attributes name on the first line
      array.each do |hash|
        csv << hash.values
      end
    end
  end

end