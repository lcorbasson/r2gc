

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
    if !@measuring_engine.tool_subtype.blank?
        pdf.text "Sous type :  #{@measuring_engine.tool_subtype}"
    end
    if !@measuring_engine.brand.blank?
        pdf.text "Marque :  #{@measuring_engine.brand}"
    end
    if !@measuring_engine.version.blank?
        pdf.text "Version :  #{@measuring_engine.version}"
    end
    if !@measuring_engine.quantity.blank?
        pdf.text "Quantité :  #{@measuring_engine.quantity}"
    end
    if !@measuring_engine.laboratory.blank?
        pdf.text "Laboratoire :  #{@measuring_engine.laboratory}"
    end
    if @measuring_engine.search_entities.size>0
        pdf.text "Entité(s) de recherche :  #{@measuring_engine.search_entities}"
    end
    if @measuring_engine.search_subentities.size>0
        pdf.text "Sous entité(s) :  #{@measuring_engine.search_subentities}"
    end
end
if !@measuring_engine.operating_principles.blank?
    pdf.move_down(30)
    pdf.fill_color "92C5DA"
    pdf.text "Principes de fonctionnement"
    pdf.fill_color "333333"
    pdf.text "#{@measuring_engine.operating_principles}"
end

if !@measuring_engine.specifications.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Caractéristiques techniques"
    pdf.fill_color "333333"
    pdf.text "#{@measuring_engine.specifications}"
end

if !@measuring_engine.explanatory_document.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Document explicatif"
    pdf.fill_color "333333"
    pdf.text "#{@measuring_engine.explanatory_document}"
end

if !@measuring_engine.calibration.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Etalonnage/calibration/vérification"
    pdf.fill_color "333333"
    pdf.text "#{@measuring_engine.calibration}"
end

if !@measuring_engine.calibration_comment.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Remarque(s) Etalonnage/calibration/vérification"
    pdf.fill_color "333333"
    pdf.text "#{@measuring_engine.calibration_comment}"
end

if !@measuring_engine.purchase_date.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Date d'achat"
    pdf.fill_color "333333"
    pdf.text "#{@measuring_engine.purchase_date}"
end

if !@measuring_engine.comment.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Commentaires"
    pdf.fill_color "333333"
    pdf.text "#{@measuring_engine.comment}"
end

if !@measuring_engine.use_on_site.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Prêt possible uniquement sur le site de l’organisme propriétaire"
    pdf.fill_color "333333"
    pdf.text "#{@measuring_engine.use_on_site ? "Oui" : "Non"}"
end

if !@measuring_engine.borrowing.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Emprunt possible en dehors du site de l’organisme propriétaire"
    pdf.fill_color "333333"
    pdf.text "#{@measuring_engine.borrowing ? "Oui" : "Non"}"
end

if !@measuring_engine.mi_localization_on_site.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Localisation sur le site"
    pdf.fill_color "333333"
    pdf.text "#{@measuring_engine.mi_localization_on_site}"
end

if !@measuring_engine.localization_on_site_precision.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Précisions"
    pdf.fill_color "333333"
    pdf.text "#{@measuring_engine.localization_on_site_precision}"
end

if !@measuring_engine.internal_number.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "N° d’enregistrement interne"
    pdf.fill_color "333333"
    pdf.text "#{@measuring_engine.internal_number}"
end

if @measuring_engine.relations_from.size>0 || @measuring_engine.relations_to.size>0
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Equipement(s) lié(s)"
    pdf.fill_color "333333"
    (@measuring_engine.relations_from.collect(&:tool_to)+@measuring_engine.relations_to.collect(&:tool_from)).flatten.uniq.each do |current_tool|
        pdf.text "- current_tool.name %>"
        pdf.move_down(5)
    end
end

if !@measuring_engine.website.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Lien(s) web"
    pdf.fill_color "333333"
    pdf.text "#{@measuring_engine.website}"
end

if @measuring_engine.correspondents.size>0
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Correspondant(s)"
    pdf.fill_color "333333"
    pdf.text "#{@measuring_engine.correspondents.collect(&:name).join(', ')}"
end

if !@measuring_engine.main_correspondent.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Correspondant principal"
    pdf.fill_color "333333"
    pdf.text "#{@measuring_engine.main_correspondent}"
end