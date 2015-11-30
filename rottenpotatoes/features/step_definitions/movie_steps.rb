# Copiado do HW3
Given /the following movies exist/ do |movies_table|
  
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
end

Then /the director of \"([^"]*)\" should be \"([^"]*)\"/ do |movie_name,director|
  expect(Movie.where('title = :name', name: movie_name).first.director)
    .to eq(director)
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  found_e1 = false
  found_e2 = false
  e1_before_e2 = nil
  page.all('#movies tbody tr td').each do |td| 
    if td.text == e1
      found_e1 = true
      e1_before_e2 = found_e2 ? false : true
    elsif td.text == e2
      found_e2 = true
    end
  end
  fail "#{e1} not before #{e2}." unless e1_before_e2
end

When /I (un)?check the following ratings: (.*)/ do |un, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.gsub(/\s/,'').split(',').each do |rating|
    step %Q{I #{un}check "ratings[#{rating}]"}
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  page.all('#movies tbody tr').count.should == Movie.count
end