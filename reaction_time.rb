require 'ruby2d'

set title: "Reaction Time Game"

message = Text.new(
    'Click to begin',
    x: 220, y: 220
)
game_started = false
s = nil
initial_time = nil

on :mouse_down do |event|
    puts event.x, event.y

    if game_started
        if s.contains? event.x, event.y
            duration = (Time.new - initial_time) * 1000
            s.remove
            message = Text.new(
                "Clicked in #{duration.round} ms!!! Click to begin.",
                x: 200, y: 220
            )
            game_started = false
        end
    else
        message.remove

        s = Square.new(
            x: rand(get(:width) - 35), y: rand(get(:height) - 35),
            size: 35,
            color: 'blue',
        )
        initial_time = Time.new
        game_started = true
    end
end

show