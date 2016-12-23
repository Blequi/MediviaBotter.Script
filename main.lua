local Utilities = require("Utilities")

return Utilities.readOnly({
    version = "0.1.0",
    createdAt = "12/21/2016",
    updatedAt = "12/23/2016",
    description = "Adding OO to MediviaBotter scripting API",
    author = Utilities.readOnly({
        email: "blequi@outlook.com",
        name: "blequi"
    }),
    project = Utilities.readOnly({
        url = "https://github.com/Blequi/MediviaBotter.Script"
    }),
    modules = Utilities.readOnly({
        Creatures = require("Creatures"),
        Position = require("Position"),
        Self = require("Self"),
        Utilities = Utilities
    })
})