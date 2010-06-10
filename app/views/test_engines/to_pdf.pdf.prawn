

pdf.move_down(20)

pdf.font_size 14
pdf.fill_color "#189CC2"
pdf.text "Fiche équipement #{@test_engine.name}"

pdf.move_down(10)
pdf.font_size 10
pdf.fill_color "#333333"
pdf.move_down(10)
left = 0
if @test_engine.tool_public_photos.size>0
    image_url = "#{RAILS_ROOT}/public#{@test_engine.tool_public_photos.first.asset.url(:thumb)}".split("?")[0]

    pdf.bounding_box [0, 670], :width => 200  do
        pdf.image image_url
    end
    left = 200
end

pdf.bounding_box [left, 670], :width => 400  do
    pdf.text "Nom :  #{@test_engine.name}"
    pdf.text "Type :  Moyen d'essai"
    pdf.text "Sous type :  #{@test_engine.tool_subtype}"
    pdf.text "Marque :  #{@test_engine.brand}" unless @test_engine.brand.blank?
    pdf.text "Version :  #{@test_engine.version}" unless @test_engine.version.blank?
    pdf.text "Quantité :  #{@test_engine.quantity}" unless @test_engine.quantity.blank?
    pdf.text "Laboratoire :  #{@test_engine.laboratory}" unless @test_engine.laboratory.blank?
    pdf.text "Entité(s) de recherche :  #{@test_engine.search_entities}" if @test_engine.search_entities.size>0
    pdf.text "Sous entité(s) :  #{@test_engine.search_subentities}" if @test_engine.search_subentities.size>0
end

unless @test_engine.operating_principles.blank?
    pdf.move_down(30)
    pdf.fill_color "92C5DA"
    pdf.text "Principes de fonctionnement"
    pdf.fill_color "333333"
    pdf.text "#{@test_engine.operating_principles}"
end

unless @test_engine.specifications.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Caractéristiques techniques"
    pdf.fill_color "333333"
    pdf.text "#{@test_engine.specifications}"
end

unless @test_engine.explanatory_document.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Document(s) explicatif(s)"
    pdf.fill_color "333333"
    pdf.text "#{@test_engine.explanatory_document}"
end

unless @test_engine.calibration.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Etalonnage/calibration/vérification"
    pdf.fill_color "333333"
    pdf.text "#{@test_engine.calibration}"
end

unless @test_engine.calibration_comment.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Remarque(s) Etalonnage/calibration/vérification"
    pdf.fill_color "333333"
    pdf.text "#{@test_engine.calibration_comment}"
end

unless @test_engine.purchase_date.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Date d'achat"
    pdf.fill_color "333333"
    pdf.text "#{@test_engine.purchase_date}"
end

unless @test_engine.comment.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Autre(s) commentaire(s)"
    pdf.fill_color "333333"
    pdf.text "#{@test_engine.comment}"
end

unless @test_engine.use_on_site.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Prêt possible uniquement sur le site de l’organisme propriétaire"
    pdf.fill_color "333333"
    pdf.text "#{@test_engine.use_on_site ? "Oui" : "Non"}"
end

unless @test_engine.borrowing.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Emprunt possible en dehors du site de l’organisme propriétaire"
    pdf.fill_color "333333"
    pdf.text "#{@test_engine.borrowing ? "Oui" : "Non"}"
end

unless @test_engine.mi_localization_on_site.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Localisation sur le site"
    pdf.fill_color "333333"
    pdf.text "#{@test_engine.mi_localization_on_site}"
end

unless @test_engine.localization_on_site_precision.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Précisions"
    pdf.fill_color "333333"
    pdf.text "#{@test_engine.localization_on_site_precision}"
end

unless @test_engine.internal_number.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "N° d’enregistrement interne"
    pdf.fill_color "333333"
    pdf.text "#{@test_engine.internal_number}"
end

if @test_engine.relations_from.size>0 || @test_engine.relations_to.size>0
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Equipement(s) lié(s)"
    pdf.fill_color "333333"
    (@test_engine.relations_from.collect(&:tool_to)+@test_engine.relations_to.collect(&:tool_from)).flatten.uniq.each do |current_tool|
        pdf.text "- current_tool.name %>"
        pdf.move_down(5)
    end
end

unless @test_engine.website.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Lien(s) web"
    pdf.fill_color "333333"
    pdf.text "#{@test_engine.website}"
end

if @test_engine.correspondents.size>0
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Correspondant(s)"
    pdf.fill_color "333333"
    pdf.text "#{@test_engine.correspondents.collect(&:name).join(', ')}"
end

unless @test_engine.main_correspondents.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Correspondant principal"
    pdf.fill_color "333333"
    pdf.text "#{@test_engine.main_correspondent}"
end