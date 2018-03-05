push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

-- speed of the paddle when a key is pressed
PADDLE_SPEED = 300





--[[
    This function is called exactly once 
    at the beginning of the game.
]]
function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    --seeding RNG with os time
    math.randomseed(os.time())

    -- more "retro-looking" font object we can use for any text
    smallFont = love.graphics.newFont('font.ttf', 8)
    --scoreFont = love.graphics.newFont('font.ttf', 30)

    -- set LÖVE2D's active font to the smallFont obect
    love.graphics.setFont(smallFont)

    -- initialize window with virtual resolution
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    -- initialize player scores
    --player1Score = 0
    --player2Score = 3

    -- paddle pos variable on Y axis (for movement)
    player1Y = VIRTUAL_HEIGHT / 2
    player2Y = VIRTUAL_HEIGHT / 2

    -- starting position values for ball
    ballX = VIRTUAL_WIDTH / 2 - 2
    ballY = VIRTUAL_HEIGHT / 2 - 2

    -- random ball velocity at startup
    ballDX = math.random(2) 
    -- TODO: https://youtu.be/GfwpRU0cT10?t=39m18s
    

    -- keep track of game state
    gameState = 'start'

end





--[[
    Callback function used to update the state 
    of the game every frame.
]]
function love.update(dt)
    --player 1 paddle controls
    if love.keyboard.isDown('w') then
        player1Y = player1Y + -PADDLE_SPEED * dt
    elseif love.keyboard.isDown('s') then
        player1Y = player1Y + PADDLE_SPEED * dt
    end

    --player 2 paddle controls
    if love.keyboard.isDown('up') then
        player2Y = player2Y + -PADDLE_SPEED * dt
    elseif love.keyboard.isDown('down') then
        player2Y = player2Y + PADDLE_SPEED * dt
    end
end





--[[
    Keyboard handling, called by LÖVE2D each frame; 
    Callback function triggered when a key is pressed.
]]
function love.keypressed(key)
    -- keys can be accessed by string name
    if key == 'escape' then
        -- function LÖVE gives us to terminate application
        love.event.quit()
    end

    if key == 'space' then
        -- function LÖVE gives us to terminate application
        love.event.quit()
    end
end





--[[
    Callback function used to draw on the screen every frame.
]]
function love.draw()
    --[[
        GAME BOARD ASSETS:
    ]]
    -- render at virtual resolution
    push:apply('start')

    -- clears the screen with a specific color
    love.graphics.clear(40, 45, 52, 255)

    -- welcome text 
    love.graphics.setFont(smallFont)
    love.graphics.printf('Un/Fair Pong', 0, 20, VIRTUAL_WIDTH, 'center')


    --[[
        PLAYER 1 ASSETS:
    ]]
    --[[ score:
    love.graphics.setFont(scoreFont)
    love.graphics.print(tostring(player1Score), VIRTUAL_WIDTH / 2 - 50, VIRTUAL_HEIGHT / 3)
    ]]

    -- render P1 paddle
    love.graphics.rectangle('fill', 10, player1Y, 5, 20)


    --[[
        PLAYER 2 ASSETS:
    ]]
    --[[ score:
    love.graphics.setFont(scoreFont)
    love.graphics.print(tostring(player2Score), VIRTUAL_WIDTH / 2 + 30, VIRTUAL_HEIGHT / 3)
    ]]

    -- render P2 paddle
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, player2Y, 5, 20)


    --[[
        CPU ASSETS:
    ]]
    -- render ball
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)

    -- end rendering at virtual resolution
    push:apply('end')
end
