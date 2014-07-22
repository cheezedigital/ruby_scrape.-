#this class will simulate adding two colors together to get another color.
class Colors
  ALLOWED_COLORS = [
    'red',
    'yellow',
    'blue'
  ]

  def self.add(color1, color2)
    if valid_color?(color1) && valid_color?(color2)
      if makes_green?([color1, color2])
        return 'green'
      elsif color1.downcase.eql?('red') && color2.downcase.eql?('blue')
        return 'purple'
      elsif color1.downcase.eql?('red') && color2.downcase.eql?('yellow')
        return 'orange'
      end
    end
  end

  def self.makes_green?(colors)
    colors.map(&:downcase).include?('yellow') && colors.map(&:downcase).include?('blue')
  end

  def self.makes_orange?(colors)
    colors.map(&:downcase).include?('yellow') && colors.map(&:downcase).include?('red')
  end
  
  def self.valid_color?(color)
    ALLOWED_COLORS.include?(color.downcase)
  end
end
