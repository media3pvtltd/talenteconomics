class CreatePdf < Struct.new(:data,:path)
  def perform
    data.to_file path
  end
end

