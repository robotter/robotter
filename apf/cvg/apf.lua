dofile('orders.lua')
dofile('class.lua')
dofile('galipeur.lua')

galipeur = dofile('strategy.lua')

local cof = coroutine.wrap(function() galipeur:strategy() end)
cof()

