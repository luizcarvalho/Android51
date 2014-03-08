@week = "6"
@path = "../week#{6}/legendas/"

	dir = Dir.entries(@path+"en/")
	dir = dir - [".",".."]
	dir.each do |file|
		puts file
		file1 = File.readlines(@path+"en/"+file)
		file2 = File.readlines(@path+"pt/"+file.gsub(".txt","")+"_pt.txt")
		out = File.new(@path+"mg/"+file.gsub(".txt","")+"_mg.html","w+:UTF-8")
		out.puts "<html><head>
<meta charset=\"UTF-8\">
</head> <body>"
		
		file1.length.times do |i|			
			out.puts "<p>#{file2[i]}</p>"
			out.puts "<blockquote style=\"font-family:'Courier';\" \>#{file1[i]}</blockquote>"
		end
		out.puts "</body></html>"

		out.close

		
	end


def duplicate(file)
	File.open(@path+file.gsub(".txt","")+"_pt2.txt","w+") 
end


