require 'csv'

module CsvHelper

  def getColumns csv_file_in, columns_get_arr_in
    columns_get_arr_in.map!{ |v| v.downcase }
    fopen = CSV.open(csv_file_in, 'r')
    header = fopen.shift
    index_col_arr = header.select{ |v| columns_get_arr_in.index(v.strip.downcase) != nil }
    check_col_arr = header.select{ |v| ["horz_accuracy", "vert_accuracy"].index(v.strip.downcase) != nil}
    #p index_col_arr
    output_characters = []
    fopen.each do |row|
      bNext = false
      #checking accurancy
      check_col_arr.each do |v|
        if row[header.index(v)].to_f >= 30.0 #accurancy
          bNext = true
          break
        end
      end
      next if bNext
      #add good results to database
      row_arr = []
      index_col_arr.each do |ind|
        # puts row[header.index(ind)]
        row_arr << row[header.index(ind)].to_f
      end
      output_characters << row_arr
    end
    fopen.close
    output_characters
  end

end

