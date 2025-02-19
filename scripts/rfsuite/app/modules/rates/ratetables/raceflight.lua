local mspapi = {
    api = {
        [1] = 'RC_TUNING',
    },
    formdata = {
        name = "RACEFLIGHT",
        labels = {
        },
        rows = {
            "Roll",
            "Pitch",
            "Yaw",
            "Col"
        },
        cols = {
            "RC Rate", 
            "Acro+", 
            "Expo"
        },
        fields = {
            -- rc rate
            {row = 1, col = 1, min = 0, max = 100, default = 240, mult = 10, mspapi = 1, apikey = "rcRates_1"},
            {row = 2, col = 1, min = 0, max = 100, default = 240, mult = 10, mspapi = 1, apikey = "rcRates_2"},
            {row = 3, col = 1, min = 0, max = 100, default = 400, mult = 10, mspapi = 1, apikey = "rcRates_3"},
            {row = 4, col = 1, min = 0, max = 100, default = 125, decimals = 1, scale = 4, mspapi = 1, apikey = "rcRates_4"},
            -- acro+
            {row = 1, col = 2, min = 0, max = 255, default = 0, mspapi = 1, apikey = "rates_1"},
            {row = 2, col = 2, min = 0, max = 255, default = 0, mspapi = 1, apikey = "rates_2"},
            {row = 3, col = 2, min = 0, max = 255, default = 0, mspapi = 1, apikey = "rates_3"},
            {row = 4, col = 2, min = 0, max = 255, default = 0, mspapi = 1, apikey = "rates_4"},
            -- expo
            {row = 1, col = 3, min = 0, max = 100, default = 0, mspapi = 1, apikey = "rcExpo_1"},
            {row = 2, col = 3, min = 0, max = 100, default = 0, mspapi = 1, apikey = "rcExpo_2"},
            {row = 3, col = 3, min = 0, max = 100, default = 0, mspapi = 1, apikey = "rcExpo_3"},
            {row = 4, col = 3, min = 0, max = 100, default = 0, mspapi = 1, apikey = "rcExpo_4"}
        }
    }                 
}


return mspapi