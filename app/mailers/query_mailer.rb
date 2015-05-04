class QueryMailer < ApplicationMailer
  default from: "john.marinelli.dev@gmail.com"
  
  def query_mail(user, json)
    @posts = get_posts_from_json json
    mail(to: user.email, subject: 'Your query results')
  end

  def get_posts_from_json(json)
    posts = []

    json['postings'].each do |post|
      # TODO: img = post['images'][0]['full']
      heading = post['heading']
      location = post['formatted_address'] or CityReference.find_city_by_code post['location']['city'] or ZipcodeReference.find_zipcode_by_code post['location']['zipcode']
      price = post['price'] || 'N/A'

      posts << { :heading => heading, :location => location, :price => price }
    end

    posts
  end
end
