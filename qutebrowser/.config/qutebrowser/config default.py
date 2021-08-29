import dracula.draw

# Load existing settings made via :set
config.load_autoconfig()

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})

config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')
