class AssessmentController < ApplicationController
layout 'home'
  def index
     
  end
  def show

  end
  def complete
    @email = params[:url]
    Delayed::Job.find(params[:manage]).invoke_job
  end
  def benchmark
    if session[:main_id].nil? 
      redirect_to signin_path, :notice => "Please sign in"
    else
      @country = Survey.all.map(&:region).uniq
      @industry = Survey.all.map(&:industry).uniq
      @country.delete(0)
      @industry.delete(0)
      @country_list = Answer::REG.select { |k| @country.include?(k[1]) }
      @industry_list = Answer::IND.select { |k| @industry.include?(k[1]) }
    end
  end
  def create
    @sp = Survey.new(:first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email], :organization => params[:organization], :title => params[:title], :industry => params[:industry].to_i, :region => params[:country].to_i, :role => params[:role].to_i)
    if @sp.save
       @alpha = params.select {|k,v| k =~ /alpha/}
       @beta = params.select {|k,v| k =~ /beta/}
       @gamma = params.select {|k,v| k =~ /gamma/}
       @delta = params.select {|k,v| k =~ /delta/}
       @omega = params.select {|k,v| k =~ /omega/}
       @epsilon = params.select {|k,v| k =~ /epsilon/}
       @zeta = params.select {|k,v| k =~ /zeta/}
       @eta = params.select {|k,v| k =~ /\Aeta/}
       @theta = params.select {|k,v| k =~ /theta/}
       @iota = params.select {|k,v| k =~ /iota/}
       @lambda = params.select {|k,v| k =~ /lambda/}
       @avg = []
       [@alpha,@beta,@gamma,@delta,@omega,@epsilon,@zeta,@eta,@theta,@iota, @lambda].each_with_index {|value,index| @avg[index] = packup value, @sp.id, index+1 } 
       Avg.create(:alpha => @avg[0], :beta => @avg[1], :gamma => @avg[2], :delta => @avg[3], :omega => @avg[4], :epsilon => @avg[5], :zeta => @avg[6], :eta => @avg[7], :theta => @avg[8], :iota => @avg[9], :lambda => @avg[10], :survey_id => @sp.id)
       redirect_to :controller => :wicked, :action => :download, :name => "#{@sp.first_name}", :parseit => @avg.to_query('values'), :user => @sp.to_query('details')
    else
      redirect_to :action => :index, :notice => 'Something went wrong'
    end
   end
   def results
    list = []
    if params[:country].blank? && params[:industry].blank?
      rs = []
    elsif params[:country].blank? && !params[:industry].blank?
      rs = Survey.where("industry=?",params[:industry])
    elsif params[:industry].blank? && !params[:country].blank?
      rs = Survey.where("region=?",params[:country])
    else
      rs = Survey.where("region=?",params[:country]).where("industry=?",params[:industry])
    end
    unless rs.empty?
    rs.select(:id).each { |v| list << v.id }
      @vals = Avg.where("survey_id in (?)",list)
      @a = []
      @b = []
      @g = []
      @d = []
      @o = []
      @ep = []
      @z = []
      @e = []
      @t = []
      @i = []
      @l = []
      @vals.each do |rs|
        @a << rs.alpha
        @b << rs.beta
        @g << rs.gamma
        @d << rs.delta
        @o << rs.omega
        @ep << rs.epsilon
        @z << rs.zeta
        @e << rs.eta
        @t << rs.theta
        @i << rs.iota
        @l << rs.lambda
      end
      one = @a.inject {|sum,n| sum+n}
      to = @b.inject {|sum,n| sum+n}
      tr = @g.inject {|sum,n| sum+n}
      fr = @d.inject {|sum,n| sum+n}
      fv = @o.inject {|sum,n| sum+n}
      sx = @ep.inject {|sum,n| sum+n}
      sv = @z.inject {|sum,n| sum+n}
      et = @e.inject {|sum,n| sum+n}
      nn =@t.inject {|sum,n| sum+n}
      tn = @i.inject {|sum,n| sum+n}
      elvn = @l.inject {|sum,n| sum+n}
      @resct = @a.count
      @ar = [ one/@resct, to/@resct, tr/@resct, fr/@resct, fv/@resct, sx/@resct, sv/@resct, et/@resct, nn/@resct, tn/@resct, elvn/@resct]
      redirect_to :controller => 'assessment', :action => 'benchmark', :parseit => @ar.to_query('values'), :industry => "#{params[:industry]}", :country => "#{params[:country]}"
    else
      redirect_to :controller => 'assessment', :action => 'benchmark'
    end
    
  end
  def research
    if session[:main_id].nil? 
      redirect_to signin_path, :notice => "Please sign in"
    else
      @search = Refresearch.search(params[:q])
      @result = @search.result
      @pdfs = @result.where("link=?","")
      @links = @result.where("link!=?","")
      @primary = @pdfs.where("category=?", 1)
      @formats = @pdfs.where("category=?", 3)
      
      @datasources = @links.where("category=?", 2)
      @papers = @links.where("category=?", 4)
    end
  end

# used to autocomplete ajax search for research database
  def autocomplete
    @mysearch = Refresearch.search({title_cont: params[:query]}).result.pluck(:title)
    @render = {query: params[:query],suggestions: @mysearch, data: @mysearch}
    render json: @render
  end

   private
    def packup section, userid, secid
      @return = 0
      section.each do |k,v| 
        @return += v.to_i
      end
      @return = @return/section.count.to_f
    end
end
