module Examples
  module CalloutHelpers
    def callout_default
      <<~RAW
        = dsfr_callout(title: "Titre mise en avant") do
          "Les parents d’enfants de 11 à 14 ans n’ont aucune démarche à accomplir : les CAF versent automatiquement l’ARS aux familles déjà allocataires qui remplissent les conditions."
        end
        = dsfr_callout(classe: "fr-callout--green-emeraude") { "Les parents d’enfants de 11 à 14 ans n’ont aucune démarche à accomplir : les CAF versent automatiquement l’ARS aux familles déjà allocataires qui remplissent les conditions." }
      RAW
    end
  end
end
