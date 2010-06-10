

pdf.move_down(20)

pdf.font_size 14
pdf.fill_color "#189CC2"
pdf.text "Fiche équipement #{@tool_engine.name}"

pdf.move_down(10)
pdf.font_size 10
pdf.fill_color "#333333"
pdf.move_down(10)
left = 0
if @tool_engine.tool_public_photos.size>0
    image_url = "#{RAILS_ROOT}/public#{@tool_engine.tool_public_photos.first.asset.url(:thumb)}".split("?")[0]

    pdf.bounding_box [0, 670], :width => 200  do
        pdf.image image_url
    end
    left = 200
end

pdf.bounding_box [left, 670], :width => 400  do
    pdf.text "Nom :  #{@tool_engine.name}"
    pdf.text "Type :  Machine-outil"
    pdf.text "Sous type :  #{@tool_engine.tool_subtype}" unless @tool_engine.tool_subtype.blank?
    pdf.text "Marque :  #{@tool_engine.brand}" unless @tool_engine.brand.blank?
    pdf.text "Version :  #{@tool_engine.version}" unless @tool_engine.version.blank?
    pdf.text "Quantité :  #{@tool_engine.quantity}" unless tool_engine.quantity.blank?
    pdf.text "Laboratoire :  #{@tool_engine.laboratory}" unless @tool_engine.laboratory.blank?
    pdf.text "Entité(s) de recherche :  #{@tool_engine.search_entities}" if @tool_engine.search_entities.size>0
    pdf.text "Sous entité(s) :  #{@tool_engine.search_subentities}" if @tool_engine.search_subentities.size>0
end

unless @tool_engine.operating_principles.blank?
    pdf.move_down(30)
    pdf.fill_color "92C5DA"
    pdf.text "Principes de fonctionnement"
    pdf.fill_color "333333"
    pdf.text "#{@tool_engine.operating_principles}"
end

unless @tool_engine.specifications.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Caractéristiques techniques"
    pdf.fill_color "333333"
    pdf.text "#{@tool_engine.specifications}"
end

unless @tool_engine.explanatory_document.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Document(s) explicatif(s)"
    pdf.fill_color "333333"
    pdf.text "#{@tool_engine.explanatory_document}"
end

unless @tool_engine.purchase_date.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Date d'achat"
    pdf.fill_color "333333"
    pdf.text "#{@tool_engine.purchase_date}"
end

unless @tool_engine.comment.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Autre(s) commentaire(s)"
    pdf.fill_color "333333"
    pdf.text "#{@tool_engine.comment}"
end

unless @tool_engine.use_on_site.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Prêt possible uniquement sur le site de l’organisme propriétaire"
    pdf.fill_color "333333"
    pdf.text "#{@tool_engine.use_on_site ? "Oui" : "Non"}"
end

unless @tool_engine.mi_localization_on_site.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Localisation sur le site"
    pdf.fill_color "333333"
    pdf.text "#{@tool_engine.mi_localization_on_site}"
end

unless @tool_engine.internal_number.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "N° d’enregistrement interne"
    pdf.fill_color "333333"
    pdf.text "#{@tool_engine.internal_number}"
end


if @tool_engine.relations_from.size>0 || @tool_engine.relations_to.size>0
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Equipement(s) lié(s)"
    pdf.fill_color "333333"
    (@tool_engine.relations_from.collect(&:tool_to)+@tool_engine.relations_to.collect(&:tool_from)).flatten.uniq.each do |current_tool|
        pdf.text "- current_tool.name %>"
        pdf.move_down(5)
    end
end

unless @tool_engine.website.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Lien(s) web"
    pdf.fill_color "333333"
    pdf.text "#{@tool_engine.website}"
end

if @tool_engine.correspondents.size>0
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Correspondant(s)"
    pdf.fill_color "333333"
    pdf.text "#{@tool_engine.correspondents.collect(&:name).join(', ')}"
end

unless @tool_engine.main_correspondents.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Correspondant principal"
    pdf.fill_color "333333"
    pdf.text "#{@tool_engine.main_correspondent}"
end