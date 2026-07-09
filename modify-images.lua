function Image (elem)
  -- 1. Keep your existing image modifications
  elem.classes:insert("responsive-img")
  elem.attributes["loading"] = "lazy"
  
  -- 2. Create the outer link using the image's source URL
  local link = pandoc.Link(elem, elem.src)
  
  -- 3. Configure the link for GLightbox
  link.classes:insert('glightbox')
  
  -- 4. If the image has alt text, pass it to the lightbox title popup
  if elem.caption and #elem.caption > 0 then
    link.attributes['data-title'] = pandoc.utils.stringify(elem.caption)
  elseif elem.title and elem.title ~= "" then
    link.attributes['data-title'] = elem.title
  end

  return link
end

