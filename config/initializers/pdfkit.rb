PDFKit.configure do |config|
     config.wkhtmltopdf = '/usr/local/bin/wkhtmltopdf' if Rails.env.production?
     config.root_url = "http://localhost"
  	 config.verbose = false
end