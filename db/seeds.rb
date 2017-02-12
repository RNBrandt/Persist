user = User.new(first_name: 'Bob', last_name: 'Ross', address: '2340 Telegraph Avenue', city: 'Berkeley', state: 'CA', zip_code: '94704')
user.save

client = Client.new(name: 'The Guild of Public Artists', email: 'public@art.guild', description: 'We are dedicated to enriching public life with freely available programming and instruction in the arts. We represent the interests of public television and radio artists.')
client.save

petition = Document.new(name: 'Petition to Fund Public Arts Programs in Alameda County')
petition2 = Document.new(name: 'Support Berkeley Public Television')
petition.save
petition2.save