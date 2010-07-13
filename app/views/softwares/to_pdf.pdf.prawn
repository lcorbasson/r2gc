

pdf.move_down(20)

pdf.font_size 14
pdf.fill_color "#189CC2"
pdf.text "Fiche équipement #{@software.name}"

pdf.move_down(10)
pdf.font_size 10
pdf.fill_color "#333333"
pdf.move_down(10)
left = 0
if @software.tool_public_photos.size>0
    image_url = "#{RAILS_ROOT}/public#{@software.tool_public_photos.first.asset.url(:thumb)}".split("?")[0]

    pdf.bounding_box [0, 670], :width => 200  do
        pdf.image image_url
    end
    left = 200
end

pdf.bounding_box [left, 670], :width => 400  do
    pdf.text "Nom :  #{@software.name}"
    pdf.text "Type :  Logiciel"
    pdf.text "Sous type :  #{@software.tool_subtype}"
    unless @software.brand.blank?
        pdf.text "Marque :  #{@software.brand}"
    end
    unless @software.version.blank?
        pdf.text "Version :  #{@software.version}"
    end
    unless @software.quantity.blank?
        pdf.text "Quantité :  #{@software.quantity}"
    end
    unless @software.laboratory.blank?
        pdf.text "Laboratoire :  #{@software.laboratory}"
    end
    if current_user
        if @software.search_entities.size>0
            pdf.text "Entité(s) de recherche :  #{@software.search_entities}"
        end
        if @software.search_subentities.size>0
            pdf.text "Sous entité(s) :  #{@software.search_subentities}"
        end
    end
    if @software.software_statuses.size>0
        pdf.text "Statut du logiciel :  #{@software.software_statuses}"
    end
    if @software.software_application_domains.size>0
        pdf.text "Domaines d'applications :  #{@software.software_application_domains}"
    end
    unless @software.software_application_domain_comment.blank?
        pdf.text "Précisions :  #{@software.software_application_domain_comment}"
    end
    if current_user
        unless @software.software_can_develop_programs.blank?
            pdf.text "Logiciel permettant de développer des programmes internes ? :  #{@software.software_can_develop_programs.eql?(1) ? 'oui' : 'non'}"
        end
    end
end

unless @software.software_description.blank?
    pdf.move_down(30)
    pdf.fill_color "92C5DA"
    pdf.text "Description et usages du Logiciel"
    pdf.fill_color "333333"
    pdf.text "#{@software.software_description}"
end
if current_user
    unless @software.specifications.blank?
        pdf.move_down(20)
        pdf.fill_color "92C5DA"
        pdf.text "Spécificités techniques du Logiciel"
        pdf.fill_color "333333"
        pdf.text "#{@software.specifications}"
    end

    unless @software.software_sharing_conditions.blank?
        pdf.move_down(20)
        pdf.fill_color "92C5DA"
        pdf.text "Caractéristiques de partage et de diffusion du logiciel"
        pdf.fill_color "333333"
        pdf.text "#{@software.software_sharing_conditions}"
    end

    unless @software.comment.blank?
        pdf.move_down(20)
        pdf.fill_color "92C5DA"
        pdf.text "Autre(s) commentaire(s)"
        pdf.fill_color "333333"
        pdf.text "#{@software.comment}"
    end
end

if @software.relations_from.size>0 || @software.relations_to.size>0
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Equipement(s) lié(s)"
    pdf.fill_color "333333"
    (@software.relations_from.collect(&:tool_to)+@software.relations_to.collect(&:tool_from)).flatten.uniq.each do |current_tool|
        pdf.text "- current_tool.name %>"
        pdf.move_down(5)
    end
end

unless @software.website.blank?
    pdf.move_down(20)
    pdf.fill_color "92C5DA"
    pdf.text "Lien(s) web"
    pdf.fill_color "333333"
    pdf.text "#{@software.website}"
end

if current_user
    if @software.secondary_correspondents.size>0
        pdf.move_down(20)
        pdf.fill_color "92C5DA"
        pdf.text "Correspondant(s)"
        pdf.fill_color "333333"
        pdf.text "#{@software.secondary_correspondents.collect(&:name).join(', ')}"
    end

    if !@software.main_correspondent.blank?
        pdf.move_down(20)
        pdf.fill_color "92C5DA"
        pdf.text "Correspondant principal"
        pdf.fill_color "333333"
        pdf.text "#{@software.main_correspondent}"
    end
end