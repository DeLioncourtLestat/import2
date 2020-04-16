
class Pipedrive

  def initialize (data_acces)
    @api_token = data_acces.api_token
    @company_name = data_acces.company_name
  end

  def load_persons
    load_objects("persons")
  end

  def load_users
    load_objects("users")
  end

  def load_organizations
    load_objects("organizations")
  end

  def load_activities
    load_objects("activities")
  end

  def load_сurrencies
    load_objects("сurrencies")
  end

  def load_objects(object_name)
    # Номер строки
    start = 0
    # Лимит вывода
    limit = 500
    # флаг цикла
    start_flag = true
    while start_flag
      start_flag = false
      full_url = "https://" + @company_name + ".pipedrive.com/v1/" + object_name +
          "?api_token=" + @api_token + "&start=" + start.to_s + "&limit=" + limit.to_s
      uri = URI.parse(full_url)
      responce = Net::HTTP.get_response(uri)
      content = JSON.parse(responce.body)
      arr = []
      count = 0
      # парсим Json, кладем в массив
      while content["data"][count] != nil do
        arr << content["data"][count]
        count += 1
        # Если записей в первом листе 500,
        # то устанавливаем start += 500
        # start_flag = true
        if count == 499
          start += limit
          start_flag = true
          end
        end
    end
    return arr
  end

end