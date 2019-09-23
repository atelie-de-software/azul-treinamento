require 'dispel'

x = 0
y = 0
output = ''

def check_boundaries(x, y, width, height, key)
  x += 1 if key == :right && x <= width
  x -= 1 if key == :left && x >= 1
  y += 1 if key == :up && y <= height
  y -= 1 if key == :down && y >= 1

  [x, y]
end

# draw app and redraw after each keystroke
Dispel::Screen.open do |screen|
  Dispel::Keyboard.output timeout: 0.5 do |key|
    screen.draw output
    next unless key

    moviment_keys = %i[up down left right]

    x = 0
    y = 0
    width = 10
    height = 10

    exit(true) if key == :"Ctrl+c"

    x, y = check_boundaries(x, y, width, height, key) if moviment_keys.include?(key)

    # output = "The time is #{Time.now}\n"
    next if key == :timeout

    # output += "You pressed #{key}\n"
    # output += "x: #{x} y: #{y}\n"


    output = "+--------+\n" +
             "|        |\n" +
             "|        |\n" +
             "|        |\n" +
             "|        |\n" +
             "|        |\n" +
             "|        |\n" +
             "|        |\n" +
             "|        |\n" +
             "+--------+"
  end
end


