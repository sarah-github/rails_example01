require 'savon'
require 'nokogiri'

class GetWebserviceDataController < ApplicationController
  
  def index
    client = Savon.client(wsdl: "https://www-genesis.destatis.de/genesisWS/services/DownloadService?wsdl")
    response = client.call(:tabellen_download, message: {"kennung" => Rails.application.secrets.destatis_name, "passwort" => Rails.application.secrets.destatis_pw, "name" => '43111-0001', "bereich" => 'Alle', "format" => 'gsb', "komprimierung" => false, "startjahr" => '2015', "endjahr" => '2015', "zeitscheiben" => '', "regionalschluessel" => '', "sachmerkmal" => '', "sachschluessel" => '', "sprache" => ''})

    @xml = response.to_xml
  end

end
