local qmk = require 'qmk'
qmk.setup {
    name = 'LAYOUT_ergodox_pretty', -- identify your layout name
    comment_preview = {
        keymap_overrides = {
            HERE_BE_A_LONG_KEY = 'Magic', -- replace any long key codes
        },
    },
    layout = { -- create a visual representation of your final layout
        -- 'x ^xx', -- including keys that span multple rows (with alignment left, center or right)
        -- '_ x x', -- pad empty cells
        -- '_ x x',
         'x x x x x x x _ _ _ x x x x x x x',
         'x x x x x x x _ _ _ x x x x x x x',
         'x x x x x x _ _ _ _ _ x x x x x x',
         'x x x x x x x _ _ _ x x x x x x x',
         'x x x x x _ _ _ _ _ _ _ x x x x x',
         '_ _ _ _ _ x x _ _ _ x x _ _ _ _ _',
         '_ _ _ _ _ _ x _ _ _ x _ _ _ _ _ _' ,
         '_ _ _ _ x x x _ _ _ x x x _ _ _ _',
    },
}


-- patricks keyboard left hand:
-- x x x x x
-- x x x x x
-- x x x x x
-- _ x x _ _ x x x

