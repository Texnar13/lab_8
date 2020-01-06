require 'nokogiri'
require 'open-uri'

class ProxyController < ApplicationController
  def input
  end


  before_action :parse_params, only: :output
  def output
    my_url = "http://localhost:3000/?&pm=#{@cl_pm}&format=xml"
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

  def parse_params
    @cl_pm = params[:pm_enter]
    @side = params[:side]
  end

  def xslt_transform(data, transform: "#{Rails.root}/public/server_transform.xslt")
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read(transform))
    xslt.transform(doc)
  end

  def insert_browser_xslt(data, transform: '/browser_transform.xslt')
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc, 'xml-stylesheet', 'type="text/xsl" href="' + transform + '"')
    doc.root.add_previous_sibling(xslt)
    doc
  end


end
