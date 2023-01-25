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
end
