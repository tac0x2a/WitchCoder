module ApplicationHelper
  require "coderay"
  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
        lang =  case language&.split(':')&.first&.to_s
                  when 'rb'
                   'ruby'
                  when 'yml'
                   'yaml'
                  when 'json'
                   'json'
                  when 'css'
                    'css'
                  when 'html'
                   'html'
                  else
                    'md'
                  end

        CodeRay.scan(code, lang).div
    end
  end

  require "redcarpet"
  def markdown(text)
    html_render = HTMLwithCoderay.new(filter_html: true, hard_wrap: true)
    options = {
        autolink: true,
        space_after_headers: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        tables: true,
        hard_wrap: true,
        xhtml: true,
        lax_html_blocks: true,
        strikethrough: true
    }
    markdown = Redcarpet::Markdown.new(html_render, options)
    markdown.render(text)
  end

  def link_to_add_fields(name, f, association, params = {}, &block)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end

    clazz = "add_fields"
    clazz += " " + params[:class] if params[:class]
    options = {class: clazz, data: {id: id, fields: fields.gsub("\n", "")}}

    if block
      link_to('#', options, &block)
    else
      link_to(name, '#', options)
    end
  end
end
