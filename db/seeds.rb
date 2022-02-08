ActiveRecord::Migration.say_with_time('Creating SearchNotebooks') do
   50.times do |i|
    SearchNotebook.create!(title: "Notebook_#{i}")
   end
end