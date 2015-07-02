class QueryMailer < ApplicationMailer
  default from: "searcher@mysweetdeal.com"
  
  def query_mail(user, json, first_time_searching, title)
    @posts = get_posts_from_json json
    @first_time_searching = first_time_searching
    mail to: user.email, subject: "Search results from omnisearch.com: '#{title}'"
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
      date_posted = Time.at(post['timestamp']).to_date

      posts << { 
        :img => img, 
        :heading => heading, 
        :location => location, 
        :date_posted => date_posted,
        :price => price, 
        :body => body, 
        :url => url 
      }
    end unless json['postings'].nil?

    posts
  end
end
