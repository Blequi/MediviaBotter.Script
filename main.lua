local Utilities = require("Blequi.Utilities")

return Utilities.readOnly({
    version = "0.2.0",
    createdAt = "12/21/2016",
    updatedAt = "12/27/2016",
    description = "Adding OO to MediviaBotter scripting API",
    author = Utilities.readOnly({
        email = "blequi@outlook.com",
        name = "blequi"
    }),
    project = Utilities.readOnly({
        url = "https://github.com/Blequi/MediviaBotter.Script"
    }),
    modules = Utilities.readOnly({
        Creatures = require("Blequi.Creatures"),
        Position = require("Blequi.Position"),
        Self = require("Blequi.Self"),
        Utilities = Utilities
    })
})