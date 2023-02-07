config = {
    key_open = 'E',
    -- If you use weight system on your server, enable this variable
    use_weight_system = true,
}

-- Here you add the products that will be sold on each machine
-- The MAXIMUM products that can be added is 15
-- Add the product as follows: {name = "NameProduct", label = "LabelProduct", price = SomeNumber}
-- name  -> Name index of item
-- label -> Name that the player sees of the item
-- weight -> Weight of the item, if you use limit system, ignore this
-- price -> Amount charged for the product
types_machine = {
    -- If you want all machines to have the same products, put the products here
    all_machines = {
        -- {name = "chips2", label = "Chips2", weight = 0, price = 50.0},
        -- {name = "chips", label = "Chips", weight = 0, price = 50.0},
        -- {name = "cigarets", label = "Cigarets", weight = 0, price = 50.0},
        -- {name = "energy", label = "Energy", weight = 0, price = 50.0},
        -- {name = "orange", label = "Orange", weight = 0, price = 50.0},
        -- {name = "pepsi", label = "Pepsi", weight = 0, price = 50.0},
        -- {name = "refrigerante", label = "Refrigerante", weight = 0, price = 50.0},
        -- {name = "snack", label = "Snack", weight = 0, price = 50.0},
        -- {name = "snack2", label = "Snack2", weight = 0, price = 50.0},
        -- {name = "snack3", label = "Snack3", weight = 0, price = 50.0},
        -- {name = "snack4", label = "Snack4", weight = 0, price = 50.0},
        -- {name = "suco", label = "Suco", weight = 0, price = 50.0},
    },

    -- Drink machine (coffee)
    prop_vend_coffe_01 = {
        
    },

    -- drink machine
    prop_vend_fridge01 = {
        
    },

    -- food machine
    prop_vend_snak_01 = {
        
    },

    -- food machine
    prop_vend_snak_01_tu = {

    },

    -- drink machine (soda)
    prop_vend_soda_01 = {
        
    },

    -- drink machine (soda)
    prop_vend_soda_02 = {
        
    },

    -- drink machine (water)
    prop_vend_water_01 = {

    },

}

-- Here you add the name of the machine prop
props_machine = {
    "prop_vend_coffe_01",
    "prop_vend_fridge01",
    "prop_vend_snak_01",
    "prop_vend_snak_01_tu",
    "prop_vend_soda_01",
    "prop_vend_soda_02",
    "prop_vend_water_01",
}

-- Here you translate the graphical interface
translate = {
    TR_SELECT_PRODUCT = "SELECT YOUR PRODUCT",
    TR_PRODUCT = "PRODUCT",
    TR_SIMBOL_MONEY = "$",
    TR_CONFIRM_PAYMENT = "Confirm Payment",
    TR_RESET_SELECTION = "Reset Selection",
    TR_EXIT = "Exit",
    TR_CONFIRMING = "CONFIRMING PAYMENT...",
    TR_WAIT = "WAIT",
    TR_NOTIFY = "To use the machine, press",
    TR_NOT_WEIGHT = "Your inventory is too full.",
    TR_NOT_MONEY = "You dont have money.",
}