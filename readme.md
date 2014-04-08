Carrierwave database storage addon
===================================

This gem allows you to upload your files in Database (BLOB) using Carrierwave gem.
*Work in progress*

###2 April :

Making use of : 
- factory-girl

```
FactoryGirl.define do
  factory :apartment do
    name "Curacao_Apartment"
    description  "Nice Apartment near the ocean good for drinking Blue-Curacao"
    picture File.open('spec/fixtures/images/blue-curacao.jpg', 'r')
 end
end
```

added to spec_helper:

```
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

```

###8 April :
The table_name need to be configurable per instance
eg : 
If I have Apartment uploader need to be able to upload to an apartmentTable and if I have a car uploader need to be able to 
carTable 

