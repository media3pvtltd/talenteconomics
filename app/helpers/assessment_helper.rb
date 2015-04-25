module AssessmentHelper
	def getfilepath id
		@dynamic = Reffile.find(id).file_uid unless id.nil?
		@val = "/system/refinery/resources/#{@dynamic}"
	end
end
