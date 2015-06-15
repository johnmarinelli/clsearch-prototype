module QueryMailerHelper
  def first_time_searching_text(first_time)
    if first_time
      <<-eod
        <h3>Since this is your first query result and there is no last time searched value, 
            we're giving you some recent results.</h3>
      eod
    else
      ''
    end
  end
end
