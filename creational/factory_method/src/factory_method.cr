abstract class Button
  abstract def render
  abstract def on_click
end

abstract class Dialog
  abstract def create_button : Button

  def render
    ok_button = create_button
    ok_button.on_click
    ok_button.render
  end
end

class WindowsDialog < Dialog
  def create_button : Button
    WindowButton.new
  end
end

class WebDialog < Dialog
  def create_button : Button
    HTMLButton.new
  end
end

class WindowButton < Button
  def render
    puts "Render windows button"
  end

  def on_click
    puts "Windows on click"
  end
end

class HTMLButton < Button
  def render
    puts "Render web button"
  end

  def on_click
    puts "Web on click"
  end
end

class Application
  property dialog : Dialog

  def initialize(config)
    if config == "Windows"
      @dialog = WindowsDialog.new
    elsif config == "Web"
      @dialog = WebDialog.new
    else
      raise Exception.new "Unknow operating system"
    end
  end

  def render
    @dialog.render
  end
end

app = Application.new("Windows")
app.render

app = Application.new("Web")
app.render
