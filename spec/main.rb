require 'dispel'

x = 0
y = 0
output = ''
# draw app and redraw after each keystroke
Dispel::Screen.open do |screen|
  Dispel::Keyboard.output timeout: 0.5 do |key|
    screen.draw output
    next unless key

    exit(true) if key == :"Ctrl+c"

    x += 1 if key == :right
    x -= 1 if key == :left
    y += 1 if key == :up
    y -= 1 if key == :down

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
