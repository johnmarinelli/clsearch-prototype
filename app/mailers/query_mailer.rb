class QueryMailer < ApplicationMailer
  default from: "john.marinelli.dev@gmail.com"
  
  def query_mail(user, json)
    @posts = get_posts_from_json json
    mail(to: user.email, subject: 'Your query results')
  end

  def get_posts_from_json(json)
    posts = []

    json['postings'].each do |post|
      # LOL VVV
      img = post['images'].nil? ? nil : post['images'][0].nil? ? nil : post['images'][0]['full']
      heading = post['heading']
      location = (post['formatted_address'] or CityReference.find_city_by_code post['location']['city'] or ZipcodeReference.find_zipcode_by_code post['location']['zipcode']) 
      price = post['price'] || 'N/A'
      body = post['body'] || 'No description found'
      url = post['external_url']

      posts << { :img => img, :heading => heading, :location => location, :price => price, :body => body, :url => url }
    end

    posts
  end
end
