Citizen.CreateThread(function()
    TriggerEvent("chat:addSuggestion", "/listitems", "[STAFF] Lister tous les items dans le système d'inventaire.", {})

    TriggerEvent("chat:addSuggestion", "/lookupitem", "[STAFF] Rechercher un item dans le système d'inventaire", {
        {name = "Partial Name", help = "Le nom partiel d'un item"}
    })

    TriggerEvent("chat:addSuggestion", "/giveitem", "[STAFF] Donner un ou des items à un joueur", {
        {name = "Player ID", help = "L'ID du joueur"},
        {name = "Item Name", help = "Le nom de l'item"},
        {name = "Amount", help = "La quantité"}
    })

    TriggerEvent("chat:addSuggestion", "/removeitem", "[STAFF] Supprimer un ou des items d'un joueur", {
        {name = "Player ID", help = "L'ID du joueur"},
        {name = "Item Name", help = "Le nom de l'item"},
        {name = "Amount", help = "La quantité"}
    })

    TriggerEvent("chat:addSuggestion", "/tp", "[STAFF] Se téléporter sur joueur.", {
        {name = "Player ID / X", help = "L'ID du joueur, ou coordonnée X"},
        {name = "Y", help = "coordonnée Y"},
        {name = "Z", help = "coordonnée Z"}
    })
    
    TriggerEvent("chat:addSuggestion", "/goto", "[STAFF] Se téléporter sur joueur.", {
        {name = "Player ID / X", help = "L'ID du joueur, or ou coordonnée X"},
        {name = "Y", help = "coordonnée Y"},
        {name = "Z", help = "coordonnée Z"}
    })
    TriggerEvent("chat:addSuggestion", "/bring", "[STAFF] Amenez un joueur à vous.", {
        {name = "Player ID", help = "L'ID du joueur"}
    })
    TriggerEvent("chat:addSuggestion", "/trash", "[STAFF] Ouvrir une poubelle.", {})

    TriggerEvent("chat:addSuggestion", "/tpm", "[STAFF] Se téléporter au marqueur de la map.", {})

    TriggerEvent("chat:addSuggestion", "/invis", "[STAFF] Activer l'invisibilité.", {})

    TriggerEvent("chat:addSuggestion", "/announce", "[STAFF] Envoyer une annonce à tout les joueurs.", {
        {name = "Message", help = "Le message à envoyer"}
    })
    TriggerEvent("chat:addSuggestion", "/kick", "[STAFF] Kick un joueur du serveur.", {
        {name = "Player ID", help = "L'ID du joueur"},
        {name = "Reason", help = "La raison du kick"}
    })
    TriggerEvent("chat:addSuggestion", "/ban", "[STAFF] Bannir un joueur du serveur.", {
        {name = "Player ID", help = "L'ID du joueur"},
        {name = "Hours", help = "Le nombre d'heure pour la durée du ban (mettre 99999 pour permanant)"},
        {name = "Reason", help = "La raison du ban"}
    })
    TriggerEvent("chat:addSuggestion", "/openinv", "[STAFF] Ouvrir l'inventaire d'un joueur.", {
        {name = "Player ID", help = "L'ID du joueur"}
    })
    TriggerEvent("chat:addSuggestion", "/spec", "[STAFF] Observer un joueur.", {
        {name = "Player ID / off", help = "L'ID du joueur, ou rien pour arrêter le mode spec"}
    })
    TriggerEvent("chat:addSuggestion", "/floadskin", "[STAFF] Forcer le rechargement du skin d'un joueur.", {
        {name = "Player ID", help = "L'ID du joueur"}
    })

    TriggerEvent("chat:addSuggestion", "/bills", "Voir vos factures.", {})
    TriggerEvent("chat:addSuggestion", "/bill", "Faire une facture à un joueur.", {
        {name = "Player ID", help = "L'ID du joueur"}
    })

    TriggerEvent("chat:addSuggestion", "/checkbills", "Voir si un joueur a payé ses factures.", {
        {name = "Player ID", help = "L'ID du joueur"}
    })

    TriggerEvent("chat:addSuggestion", "/fine", "[SHERIF] Amender un citoyen.", {
        {name = "Player ID", help = "L'ID du joueur"},
        {name = "Amount", help = "Le montant de l'amende"}
    })
    
    TriggerEvent("chat:addSuggestion", "/openstash", "[STAFF] Ouvrir une réserve.", {
        {name = "Stash ID", help = "L'ID de la réserve"}
    })

    TriggerEvent("chat:addSuggestion", "/balances", "[STAFF] Voir le montant d'argent d'un joueur.", {
        {name = "Player ID", help = "L'ID du joueur"}
    })

    TriggerEvent("chat:addSuggestion", "/steamid", "[STAFF] Voir le steamid d'un joueur.", {
        {name = "Player ID", help = "L'ID du joueur"}
    })

    TriggerEvent("chat:addSuggestion", "/pedscale", "[STAFF] Définissez l'échelle des peds.", {
        {name = "Scale Factor", help = "L'échelle à mettre (0.2-2.0)"}
    })

    TriggerEvent("chat:addSuggestion", "/pedmodel", "[STAFF] Définir votre ped.", {
        {name = "Model Name", help = "Le model du ped"}
    })

    TriggerEvent("chat:addSuggestion", "/report", "Envoyer un report au Staff.", {
        {name = "Message", help = "Le comptenu du report"}
    })

    TriggerEvent("chat:addSuggestion", "/setmoney", "[STAFF] Définir l'argent d'un joueur.", {
        {name = "Player ID", help = "L'ID du joueur"},
        {name = "Amount", help = "Le nombre d'argent"},
    })
    TriggerEvent("chat:addSuggestion", "/setjob", "[STAFF] Définir le job d'un joueur.", {
        {name = "Player ID", help = "L'ID du joueur"},
        {name = "Job ID/Name", help = "Le nom du job"},
        {name = "Rank ID", help = "Le rang du job"},
    })
    TriggerEvent("chat:addSuggestion", "/addmoney", "[STAFF] Ajouter de l'argent à un joueur.", {
        {name = "Player ID", help = "L'ID du joueur"},
        {name = "Amount", help = "Le nombre d'argent"},
    })
    TriggerEvent("chat:addSuggestion", "/addgold", "[STAFF] Ajouter de l'or à un joueur.", {
        {name = "Player ID", help = "L'ID du joueur"},
        {name = "Amount", help = "Le nombre d'or"},
    })
    TriggerEvent("chat:addSuggestion", "/addxp", "[STAFF] Ajouter de l'xp à un joueur.", {
        {name = "Player ID", help = "L'ID du joueur"},
        {name = "Amount", help = "Le nombre d'xp"},
    })
    TriggerEvent("chat:addSuggestion", "/setgroup", "[STAFF] Définir le groupe d'un joueur.", {
        {name = "Player ID", help = "L'ID du joueur"},
        {name = "Group", help = "Le groupe à définir (user, admin, superadmin)"},
    })

    TriggerEvent("chat:addSuggestion", "/me", "Affiche du texte au dessus du personnage.", {
        {name = "Message", help = "Le contenu du texte"},
    })

end)

RegisterCommand("creator", function()
    TriggerEvent("rdr_creator:OpenCreator")
end)