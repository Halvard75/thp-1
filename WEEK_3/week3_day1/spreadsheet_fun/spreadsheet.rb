require 'bundler'
Bundler.require
 
# Authenticate a session with your Service Account
session = GoogleDrive::Session.from_service_account_key("client_secret.json")
 
# Get the spreadsheet by its title
spreadsheet = session.spreadsheet_by_title("Copy of Legislators 2017")
# Get the first worksheet
worksheet = spreadsheet.worksheets.first
# Print out the first 6 columns of each row
worksheet.rows.each { |row| puts row.first(6).join(" | ") }


worksheet[2, 1] = "Updated!"
worksheet.save

=begin
worksheet.insert_rows(worksheet.num_rows + 1, [["Hello!", "This", "was", "inserted", "at", "the", "bottom"]])
worksheet.save


worksheet.insert_rows(2, [["Hello!", "This", "was", "inserted", "via", "Ruby"]])
worksheet.save

worksheet["A2"] = "Updated again!"
worksheet.save

worksheet.delete_rows(3, 1)
worksheet.save
=end