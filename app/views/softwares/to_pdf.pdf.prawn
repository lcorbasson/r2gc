

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
    pdf.text "Marque :  #{@software.brand}"
    pdf.text "Version :  #{@software.version}"
    pdf.text "Quantité :  #{@software.quantity}"
    pdf.text "Laboratoire :  #{@software.laboratory}"
    pdf.text "Entité(s) de recherche :  #{@software.search_entities}"
    pdf.text "Sous entité(s) :  #{@software.search_subentities}"
    pdf.text "Statut du logiciel :  #{@software.software_statuses}"
    pdf.text "Domaines d'applications :  #{@software.software_application_domains}"
    pdf.text "Précisions :  #{@software.software_application_domain_comment}"
    pdf.text "Logiciel permettant de développer des programmes internes ? :  #{@software.software_can_develop_programs.eql?(1) ? 'oui' : 'non'}"
end
pdf.move_down(30)
pdf.fill_color "92C5DA"
pdf.text "Description et usages du Logiciel"
pdf.fill_color "333333"
pdf.text "#{@software.software_description}"

pdf.move_down(20)
pdf.fill_color "92C5DA"
pdf.text "Spécificités techniques du Logiciel"
pdf.fill_color "333333"
pdf.text "#{@software.specifications}"

pdf.move_down(20)
pdf.fill_color "92C5DA"
pdf.text "Caractéristiques de partage et de diffusion du logiciel"
pdf.fill_color "333333"
pdf.text "#{@software.software_sharing_conditions}"

pdf.move_down(20)
pdf.fill_color "92C5DA"
pdf.text "Commentaires"
pdf.fill_color "333333"
pdf.text "#{@software.comment}"

pdf.move_down(20)
pdf.fill_color "92C5DA"
pdf.text "Equipement(s) lié(s)"
pdf.fill_color "333333"
pdf.text "#{@software.comment}"

pdf.move_down(20)
pdf.fill_color "92C5DA"
pdf.text "Lien(s) web"
pdf.fill_color "333333"
pdf.text "#{@software.website}"

pdf.move_down(20)
pdf.fill_color "92C5DA"
pdf.text "Correspondant(s)"
pdf.fill_color "333333"
pdf.text "#{@software.correspondents.collect(&:name).join(', ')}"