class ApplicationController < ActionController::Base
  def add_form
    render({ :template => "templates/add_form.html.erb"})
  end
  
  def add
    @first_num = params.fetch("first_num").to_f
    @second_num = params.fetch("second_num").to_f
    @result = @first_num + @second_num

    render({ :template => "templates/add.html.erb"})
  end

  def subtract_form
    render({ :template => "templates/subtract_form.html.erb"})
  end

  def subtract
    @first_num = params.fetch("first_num").to_f
    @second_num = params.fetch("second_num").to_f
    @result = @second_num - @first_num

    render({ :template => "templates/subtract.html.erb"})
  end

  def multiply_form
    render({ :template => "templates/multiply_form.html.erb"})
  end

  def multiply
    @first_num = params.fetch("first_num").to_f
    @second_num = params.fetch("second_num").to_f
    @result = @first_num * @second_num

    render({ :template => "templates/multiply.html.erb"})
  end

  def divide_form
    render({ :template => "templates/divide_form.html.erb"})
  end

  def divide
    @first_num = params.fetch("first_num").to_f
    @second_num = params.fetch("second_num").to_f
    @result = @first_num / @second_num

    render({ :template => "templates/divide.html.erb"})
  end

  def coordinates_form
    render({ :template => "templates/coordinates_form.html.erb"})
  end

  def coordinates
    @address = params.fetch("user_street_address")
    gmaps_api_endpoint = "https://maps.googleapis.com/maps/api/geocode/json?address=" + @address + "&key=" + ENV.fetch("GMAPS_KEY")
    gmaps_parsed_data = JSON.parse(URI.open(gmaps_api_endpoint).read)
    gmaps_results_array = gmaps_parsed_data.fetch("results")
    loc = gmaps_results_array[0].fetch("geometry").fetch("location")
    @latitude = loc.fetch("lat")
    @longitude = loc.fetch("lng")

    render({ :template => "templates/coordinates.html.erb"})
  end

  def weather_form
    render({ :template => "templates/weather_form.html.erb"})
  end

  def weather
    @latitude = params.fetch("user_latitude")
    @longitude = params.fetch("user_longitude")
    darksky_api_endpoint = "https://api.darksky.net/forecast/" + ENV.fetch("DARK_SKY_KEY") + "/" + @latitude + "," + @longitude
    darksky_parsed_data = JSON.parse(URI.open(darksky_api_endpoint).read)
    @temperature = darksky_parsed_data.fetch("currently").fetch("temperature")
    @summary = darksky_parsed_data.fetch("currently").fetch("summary")
    @outlook1 = darksky_parsed_data.fetch("minutely").fetch("summary")
    @outlook2 = darksky_parsed_data.fetch("hourly").fetch("summary")
    @outlook3 = darksky_parsed_data.fetch("daily").fetch("summary")

    render({ :template => "templates/weather.html.erb"})
  end

  def coords_weather_form
    render({ :template => "templates/coords_weather_form.html.erb"})
  end

  def coords_weather
    @address = params.fetch("user_street_address")
    gmaps_api_endpoint = "https://maps.googleapis.com/maps/api/geocode/json?address=" + @address + "&key=" + ENV.fetch("GMAPS_KEY")
    gmaps_parsed_data = JSON.parse(URI.open(gmaps_api_endpoint).read)
    gmaps_results_array = gmaps_parsed_data.fetch("results")
    loc = gmaps_results_array[0].fetch("geometry").fetch("location")
    @latitude = loc.fetch("lat")
    @longitude = loc.fetch("lng")
    
    darksky_api_endpoint = "https://api.darksky.net/forecast/" + ENV.fetch("DARK_SKY_KEY") + "/" + @latitude.to_s + "," + @longitude.to_s
    darksky_parsed_data = JSON.parse(URI.open(darksky_api_endpoint).read)
    @temperature = darksky_parsed_data.fetch("currently").fetch("temperature")
    @summary = darksky_parsed_data.fetch("currently").fetch("summary")
    @outlook1 = darksky_parsed_data.fetch("minutely").fetch("summary")
    @outlook2 = darksky_parsed_data.fetch("hourly").fetch("summary")
    @outlook3 = darksky_parsed_data.fetch("daily").fetch("summary")

    render({ :template => "templates/coords_weather.html.erb"})
  end
end
