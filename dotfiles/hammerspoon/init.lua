-- ================================ Setup Logging =================================

logger = hs.logger.new('windowManager')
logger.setLogLevel('info')

-- ========================== Spoons ===========================

arrangeDesktop = hs.loadSpoon('ArrangeDesktop')
arrangeDesktop.logger.setLogLevel('info')

-- ========================== Desktop Layout Management ===========================

hs.window.filter.ignoreAlways['Firefox Developer EditionCP Web Content'] = true
hs.window.filter.ignoreAlways['Firefox Developer EditionCP WebExtensions'] = true
hs.window.filter.ignoreAlways['Firefox Developer EditionCP RDD Process'] = true
hs.window.filter.ignoreAlways['Firefox Developer EditionCP Privileged Content'] = true
hs.window.filter.ignoreAlways['Firefox Developer EditionCP Socket Process'] = true
hs.window.filter.ignoreAlways['Slack Helper (Renderer)'] = true
hs.window.filter.ignoreAlways['TweetDeck Networking'] = true

arrangeDesktop.arrangements = {
    ['Macbook Only'] = {
        ['665DBF0A-40D5-7BE2-8B58-64350483BC8B'] = {
            ['Monitor Name'] = 'Macbook Pro',
            ['apps'] = {
                ['GoLand'] = { w = 1680.0, h = 963.0, x = -0.0, y = 23.0 },
                ['PhpStorm'] = { w = 1680.0, h = 963.0, x = -0.0, y = 23.0 },
                ['RubyMine'] = { w = 1680.0, h = 963.0, x = -0.0, y = 23.0 },
                ['DataGrip'] = { w = 1680.0, h = 963.0, x = -0.0, y = 23.0 },
                ['Slack'] = { w = 1240.0, h = 935.0, x = 207.0, y = 23.0 },
                ['Postman'] = { w = 1414.0, h = 961.0, x = 96.0, y = 23.0 },
                ['Firefox Developer Edition'] = { w = 1680.0, h = 961.0, x = -0.0, y = 23.0 },
                ['Activity Monitor'] = { w = 866, h = 527, x = 814, y = 447 },
                ['TweetDeck'] = { w = 1680.0, h = 577.0, x = 0.0, y = 23.0 },
                ['Finder'] = { w = 822.0, h = 458.0, x = -5.0, y = 269.0 },
                ['Calendar'] = { w = 1204.0, h = 691.0, x = 244.0, y = 23.0 },
                ['iTerm2'] = { w = 1450.0, h = 772.0, x = 145.0, y = 23.0 },
                ['MacVim'] = { w = 954.0, h = 959.0, x = 351.0, y = 23.0 },
                ['Music'] = { w = 1680.0, h = 777.0, x = -0.0, y = 23.0 }
            }
        }
    },
    ['Home Office'] = {
        ['665DBF0A-40D5-7BE2-8B58-64350483BC8B'] = {
            ['Monitor Name'] = 'Macbook Pro',
            ['apps'] = {
                ['Activity Monitor'] = { w = 866, h = 527, x = 814, y = 447 },
                ['TweetDeck'] = { w = 1680.0, h = 577.0, x = 0.0, y = 23.0 },
                ['Finder'] = { w = 822.0, h = 458.0, x = -5.0, y = 269.0 },
                ['Calendar'] = { w = 1204.0, h = 691.0, x = 244.0, y = 23.0 },
                ['iTerm2'] = { w = 1450.0, h = 772.0, x = 145.0, y = 23.0 },
                ['MacVim'] = { w = 954.0, h = 959.0, x = 351.0, y = 23.0 },
                ['Music'] = { w = 1680.0, h = 777.0, x = -0.0, y = 23.0 }
            }
        },
        ['A46F106F-368E-3BC7-6C8C-5E8BB0903DA6'] = {
            ['Monitor Name'] = 'Left External Monitor',
            ['apps'] = {
                ['GoLand'] = { w = 1869, h = 1213, x = 2036, y = -150 },
                ['PhpStorm'] = { w = 1869, h = 1213, x = 2036, y = -150 },
                ['RubyMine'] = { w = 1869, h = 1213, x = 2036, y = -150 },
                ['DataGrip'] = { w = 1869, h = 1213, x = 2036, y = -150 },
            }
        },
        ['4E3ABAE4-6D5B-BFCB-2322-3E47B125F0FD'] = {
            ['Monitor Name'] = 'Right External Monitor',
            ['apps'] = {
                ['Slack'] = { w = 1240, h = 935, x = 5560, y = -150 },
                ['Postman'] = { w = 1414, h = 1196, x = 5386, y = -150 },
                ['Firefox Developer Edition'] = { w = 1786, h = 1198, x = 4242, y = -150 },
            }
        }
    }
}

-- ================================== Setup Menu ==================================

menubar = hs.menubar.new()
menubar:setIcon(hs.image.imageFromName("NSHandCursor"))

if menubar then
    local menuItems = {}

    menuItems = arrangeDesktop:addMenuItems(menuItems)

    menubar:setMenu(menuItems)
end
