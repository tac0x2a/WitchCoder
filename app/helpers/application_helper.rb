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
end
