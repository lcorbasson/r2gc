

pdf.move_down(20)

pdf.font_size 14
pdf.fill_color "#189CC2"
pdf.text "Fiche équipement #{@measuring_engine.name}"

pdf.move_down(10)
pdf.font_size 10
pdf.fill_color "#333333"
pdf.move_down(10)
left = 0
if @measuring_engine.tool_public_photos.size>0
    image_url = "#{RAILS_ROOT}/public#{@measuring_engine.tool_public_photos.first.asset.url(:thumb)}".split("?")[0]

    pdf.bounding_box [0, 670], :width => 200  do
        pdf.image image_url
    end
    left = 200
end

pdf.bounding_box [left, 670], :width => 400  do
    pdf.text "Nom :  #{@measuring_engine.name}"
    pdf.text "Type :  Moyen de mesure et d'analyse"
    pdf.text "Sous type :  #{@measuring_engine.tool_subtype}"
    pdf.text "Marque :  #{@measuring_engine.brand}"
    pdf.text "Version :  #{@measuring_engine.version}"
    pdf.text "Quantité :  #{@measuring_engine.quantity}"
    pdf.text "Laboratoire :  #{@measuring_engine.laboratory}"
    pdf.text "Entité(s) de recherche :  #{@measuring_engine.search_entities}"
    pdf.text "Sous entité(s) :  #{@measuring_engine.search_subentities}"
end
pdf.move_down(30)
pdf.fill_color "92C5DA"
pdf.text "Principes de fonctionnement"
pdf.fill_color "333333"
pdf.text "#{@measuring_engine.operating_principles}"

pdf.move_down(20)
pdf.fill_color "92C5DA"
pdf.text "Caractéristiques techniques"
pdf.fill_color "333333"
pdf.text "#{@measuring_engine.specifications}"

pdf.move_down(20)
pdf.fill_color "92C5DA"
pdf.text "Document explicatif"
pdf.fill_color "333333"
pdf.text "#{@measuring_engine.explanatory_document}"

pdf.move_down(20)
pdf.fill_color "92C5DA"
pdf.text "Etalonnage/calibration/vérification"
pdf.fill_color "333333"
pdf.text "#{@measuring_engine.calibration}"

pdf.move_down(20)
pdf.fill_color "92C5DA"
pdf.text "Remarque(s) Etalonnage/calibration/vérification"
pdf.fill_color "333333"
pdf.text "#{@measuring_engine.calibration_comment}"

pdf.move_down(20)
pdf.fill_color "92C5DA"
pdf.text "Date d'achat"
pdf.fill_color "333333"
pdf.text "#{@measuring_engine.purchase_date}"

pdf.move_down(20)
pdf.fill_color "92C5DA"
pdf.text "Commentaires"
pdf.fill_color "333333"
pdf.text "#{@measuring_engine.comment}"

pdf.move_down(20)
pdf.fill_color "92C5DA"
pdf.text "Prêt possible uniquement sur le site de l’organisme propriétaire"
pdf.fill_color "333333"
pdf.text "#{@measuring_engine.use_on_site ? "Oui" : "Non"}"

pdf.move_down(20)
pdf.fill_color "92C5DA"
pdf.text "Emprunt possible en dehors du site de l’organisme propriétaire"
pdf.fill_color "333333"
pdf.text "#{@measuring_engine.borrowing ? "Oui" : "Non"}"

pdf.move_down(20)
pdf.fill_color "92C5DA"
pdf.text "Localisation sur le site"
pdf.fill_color "333333"
pdf.text "#{@measuring_engine.mi_localization_on_site}"

pdf.move_down(20)
pdf.fill_color "92C5DA"
pdf.text "Précisions"
pdf.fill_color "333333"
pdf.text "#{@measuring_engine.localization_on_site_precision}"

pdf.move_down(20)
pdf.fill_color "92C5DA"
pdf.text "N° d’enregistrement interne"
pdf.fill_color "333333"
pdf.text "#{@measuring_engine.internal_number}"


pdf.move_down(20)
pdf.fill_color "92C5DA"
pdf.text "Equipement(s) lié(s)"
pdf.fill_color "333333"
pdf.text "#{@measuring_engine.comment}"

pdf.move_down(20)
pdf.fill_color "92C5DA"
pdf.text "Lien(s) web"
pdf.fill_color "333333"
pdf.text "#{@measuring_engine.website}"

pdf.move_down(20)
pdf.fill_color "92C5DA"
pdf.text "Correspondant(s)"
pdf.fill_color "333333"
pdf.text "#{@measuring_engine.correspondents.collect(&:name).join(', ')}"