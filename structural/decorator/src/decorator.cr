abstract class Component
  def operation
    raise NotImplementedError.new("Error")
  end
end

class ConcreteComponent < Component
  def operation
    "Concrete component"
  end
end

abstract class Decorator < Component
  property :component

  def initialize(component : Component)
    @component = component
  end

  def operation
    @component.operation
  end
end

class DecoratorAlpha < Decorator
  def operation
    "Decorator alpha #{@component.operation}"
  end
end

class DecoratorBeta < Decorator
  def operation
    "Decorator beta #{@component.operation}"
  end
end

simple = ConcreteComponent.new
decorator_alpha = DecoratorAlpha.new simple
decorator_beta = DecoratorBeta.new decorator_alpha

puts simple.operation
puts decorator_alpha.operation
puts decorator_beta.operation