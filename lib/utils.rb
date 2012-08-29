module Utils
  extend self

  def upload(file, vid)
    if !file.original_filename.empty?
      old_filename=getFileName(file.original_filename)
      if vid != nil
        index = old_filename.rindex(".")
        last = old_filename[index, old_filename.length - index]
        filename = "v"+vid+last
      else
        filename = old_filename
      end
      File.open(File.expand_path(Rails.root.to_s)+"/public/files/#{filename}", "wb") do |f|
        f.write(file.read)
      end
      filename
    end
  end

  def getFileName(filename)
    if !filename.nil?
      filename
    end
  end

  def formatjson(json)
    text = JSON.parse(json) rescue ""
    pretty_json = JSON.pretty_generate(text)
    pretty_json
  end

  def videoid
    uuid = UUIDTools::UUID.random_create.to_s.gsub('-', '')
    vid = (Digest::MD5.hexdigest(uuid).to_s)[8, 16]
    vid
  end
end