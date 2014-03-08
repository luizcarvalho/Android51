@week = "6"
@path = "../week#{6}/legendas/"

	dir = Dir.entries(@path)
	dir = dir - [".",".."]
	dir.each do |file|
		merge(file)
	end


def merge(file)
		file1 = File.open(@path+"en/"+file,"w+").split("\.\r")
		file2 = File.open(@path+"pt/"+file.gsub(".txt","")+"_pt2.txt","w+").split("\.\r")
		out = File.new(@path+"mg/"+file.gsub(".txt","")+"_pt2.txt","w+")

		file1.length do |i|
			out.puts file1[i]
			out.puts file2[i]
		end
		
		file1.close
		file2.close
		out.close
end


def duplicate(file)
	File.open(@path+file.gsub(".txt","")+"_pt2.txt","w+") 
end


