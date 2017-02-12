module DocusignHelper
  require "base64"
  require 'net/http'

  def create_payload(user, document)
    doc = File.open("Mutual_NDA.pdf", 'r') { |fp| fp.read }
    @encoded = Base64.encode64(doc)
    create_vars(user, document)
    post_data
    # uri = URI 'https://demo.docusign.net/restapi/v2'
    # req = Net::HTTP::Post.new(uri.path)
    # req.set_form_data()
  end

  private

  def post_data
    post_data = {
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-DocuSign-Authentication': "{
           Username: #{@username},
           Password: #{@password},
           IntegratorKey: #{@api_key}
        }"
      },
      body:{
      "documents": [
        {
          "documentBase64": @encoded,
          "documentId": "1",
          "fileExtension": @file_extension,
          "name": "#{@document_name}.#{@file_extension}"
        }
      ],
      "emailSubject": @document_name,
      "recipients":{
        "signers": [
          {
            "email": @user_email,
            "name": @user_name,
            "clientUserId": @user_id,
            "recipientId": @user_id,
            "routingOrder": "1",
            "tabs": {
              "dateSignedTabs":[
                {
                  "anchorString": "signer1date",
                  "anchorYOffset": "-6",
                  "fontSize": "Size12",
                  "name": "Date Signed",
                  "recipientId": "1",
                  "tabLabel": "date_signed"
                },
              ],
              "fullNameTabs": [
                {
                  "anchorString": "signer1name",
                  "anchorYOffset": "-6",
                  "fontSize": "Size12",
                  "name": "Full Name",
                  "recipientId": "1",
                  "tabLabel": "Full Name"
                }
              ],
              "signHereTabs": [
                {
                  "anchorString": "signer1sig",
                  "anchorUnits": "mms",
                  "anchorXOffset": "0",
                  "anchorYOffset": "0",
                  "name": "Please sign here",
                  "optional": "false",
                  "recipientId": "1",
                  "scaleValue": 1,
                  "tabLabel": "signer1sig"
                }
              ]
            }
          }
        ]
      },
      "status": "sent"
      }
    }
  end

  def create_vars(user, document)
    @api_key = ENV['DOCUSIGN_API']
    @username =  ENV['DOCUSIGN_USERNAME']
    @password = ENV['DOCUSIGN_PASSWORD']
    @account_id = ENV['DOCUSIGN_ACCOUNT_ID']
    @file_extension = ".pdf"
    @user_id = user.id
    @user_email = user.email
    @user_name = "#{user.first_name }"+ "#{user.last_name}"
    @recipient_id = "1"#user.try.id || "1"
    @document_id = "300"#document.try.id || "300"
    @document_name = "noo" #document.try.title || "noooo"
  end
end
