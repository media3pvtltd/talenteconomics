class WickedController < ApplicationController
  def index
  	@vals = []
    @myarr = params["parseit"].split('=')
    @myarr.each {|v| @vals << v.to_i }
  end
  def download
    response.content_type = 'application/pdf'
    html = render_to_string :action => 'index', :locals => {:parseit => "#{params[:parseit]}", :details => "#{params[:user]}" }
    kit = PDFKit.new(html,:header_html => wicked_header_url, :footer_html => wicked_footer_url)
    kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/bootstrap.css"
    kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/wicked.css"
    file_path = "public/docs/"
  	file_path << params[:name]
    file_path << '.pdf'
  	# pdf = kit.to_file file_path
    respond_to do |format|
      format.html do 
        @myjob = Delayed::Job.enqueue(CreatePdf.new(kit, file_path))
        @srv = Survey.find(params[:user].split("=")[1].to_i)
        @srv.pdf_id = @myjob.id
        @srv.save
        redirect_to :controller => :assessment, :action => :complete , :url => "#{@srv.email}",:manage => "#{@myjob.id}", :name => "#{@srv.first_name}"
      end
      format.pdf do
        send_data(kit.to_pdf, :filename => params[:name], :disposition => 'inline', :type => 'application/pdf')
      end 
    end
  end
  def header
    
  end
  def footer

  end
end
