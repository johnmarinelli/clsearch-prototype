module QueryMailerHelper
  def first_time_searching_text(first_time)
    if first_time
      <<-eod
        <h3>Since this is your first query result, we're giving you
            results from <b>2 weeks ago (#{Date.today - 2.weeks})</b>.</h3>
      eod
    else
      ''
    end
  end
end
