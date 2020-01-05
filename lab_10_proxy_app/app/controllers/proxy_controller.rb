require 'nokogiri'
require 'open-uri'

class ProxyController < ApplicationController
  def input
  end


  before_action :parse_params, only: :output
  def outputmy_url = URL + "&val=#{@val}"
    api_response = open(my_url)

    if @side == 'server-xslt'
      @result = xslt_transform(api_response).to_html
    elsif @side == 'client-xslt'
      render xml: insert_browser_xslt(api_response).to_xml
    else
      render xml: api_response
    end
  end



  private

  URL = 'http://localhost:3000/?format=xml'.freeze
  SERV_TRANS = "#{Rails.root}/public/server_transform.xslt".freeze
  BROWS_TRANS = '/browser_transform.xslt'.freeze

  def parse_params
    @val = params[:pm]
    @side = params[:side]
  end

  def xslt_transform(data, transform: SERV_TRANS)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read(transform))
    xslt.transform(doc)
  end

  def insert_browser_xslt(data, transform: BROWS_TRANS)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc, 'xml-stylesheet', 'type="text/xsl" href="' + transform + '"')
    doc.root.add_previous_sibling(xslt)
    doc
  end


end
