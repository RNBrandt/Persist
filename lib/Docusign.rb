class Docusign
  include HTTParty
  base_uri 'https://demo.docusign.net/restapi/v2'
  debug_output

  def initialize
    #todo: add env yml
    @api_key = ENV[:DOCUSIGN_API]
    @username = ENV[:DOCUSIGN_USERNAME]
    @password = ENV[:DOCUSIGN_PASSWORD]
    @account_id = ENV[:DOCUSIGN_ACCOUNT_ID]
    @file_extension = ".pdf"
  end

  def to_signature(user, document)
    @user_id = user.user_id
    @email = user.email
    @user_name = "#{user.first_name }"+ "#{user.last_name}"
    @recipient_id = user.user_id
    @document_id = document.id
    @document_name = document.title
  end
end
