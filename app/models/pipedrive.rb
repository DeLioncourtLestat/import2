

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

  def load_objects(object_name)

    full_url = "https://" + @company_name + ".pipedrive.com/v1/" + object_name +"?api_token=" + @api_token + "&start=0&limit=1"
    uri = URI.parse(full_url)
    responce = Net::HTTP.get_response(uri)
    content = JSON.parse(responce.body)
    arr = {}
    count = 0
    while content["data"][count] != nil do
      arr[count] = content["data"][count]
      count += 1
    end
    return arr
  end

  end