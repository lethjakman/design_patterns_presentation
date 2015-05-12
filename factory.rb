class Square
  def draw_me
    puts "+----------+"
    puts "|          |"
    puts "|          |"
    puts "|          |"
    puts "+----------+"
  end
end

class Circle
  def draw_me
   puts "    x  x    "
   puts " x        x "
   puts "x          x"
   puts "x          x"
   puts " x        x "
   puts "    x  x    "
  end
end

class Diamond
  def draw_me
    puts " / \\ "
    puts "|   |"
    puts " \\ / "
  end
end

class SmileyFace
  def draw_me
    puts %q{                          oooo$$$$$$$$$$$$oooo                             }
    puts %q{                      oo$$$$$$$$$$$$$$$$$$$$$$$$o                          }
    puts %q{                   oo$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$o         o$   $$ o$    }
    puts %q{   o $ oo        o$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$o       $$ $$ $$o$   }
    puts %q{oo $ $ "$      o$$$$$$$$$    $$$$$$$$$$$$$    $$$$$$$$$o       $$$o$$o$    }
    puts %q{"$$$$$$o$     o$$$$$$$$$      $$$$$$$$$$$      $$$$$$$$$$o    $$$$$$$$     }
    puts %q{  $$$$$$$    $$$$$$$$$$$      $$$$$$$$$$$      $$$$$$$$$$$$$$$$$$$$$$$     }
    puts %q{  $$$$$$$$$$$$$$$$$$$$$$$    $$$$$$$$$$$$$    $$$$$$$$$$$$$$  """$$$       }
    puts %q{   "$$$""""$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$     "$$$      }
    puts %q{    $$$   o$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$     "$$$o    }
    puts %q{   o$$"   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$       $$$o   }
    puts %q{   $$$    $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" "$$$$$$ooooo$$$$o }
    puts %q{  o$$$oooo$$$$$  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   o$$$$$$$$$$$$$$$$$}
    puts %q{  $$$$$$$$"$$$$   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$     $$$$""""""""      }
    puts %q{ """"       $$$$    "$$$$$$$$$$$$$$$$$$$$$$$$$$$$"      o$$$               }
    puts %q{            "$$$o     """$$$$$$$$$$$$$$$$$$"$$"         $$$                }
    puts %q{              $$$o          "$$""$$$$$$""""           o$$$                 }
    puts %q{               $$$$o                                o$$$"                  }
    puts %q{                "$$$$o      o$$$$$$o"$$$$o        o$$$$                    }
    puts %q{                  "$$$$$oo     ""$$$$o$$$$$o   o$$$$""                     }
    puts %q{                     ""$$$$$oooo  "$$$o$$$$$$$$$"""                        }
    puts %q{                        ""$$$$$$$oo $$$$$$$$$$                             }
    puts %q{                                """"$$$$$$$$$$$                            }
    puts %q{                                    $$$$$$$$$$$$                           }
    puts %q{                                     $$$$$$$$$$"                           }
    puts %q{                                      "$$$""                               }
  end
end

class ShapeFactory
  SHAPES = {
    square: Square,
    circle: Circle,
    diamond: Diamond,
    smiley_face: SmileyFace
  }
  def self.get_shape shape_name
    SHAPES[shape_name].new
  end

  def self.random_shape
    SHAPES.values.sample.new
  end
end

gets
puts "square"
square = ShapeFactory.get_shape :square
square.draw_me
gets
puts "circle"
circle = ShapeFactory.get_shape :circle
circle.draw_me
gets
puts "diamond"
diamond = ShapeFactory.get_shape :diamond
diamond.draw_me
gets
puts "smiley face"
smiley_face = ShapeFactory.get_shape :smiley_face
smiley_face.draw_me

cmd = gets
while cmd == "\n"
  ShapeFactory.random_shape.draw_me
  cmd = gets
end
